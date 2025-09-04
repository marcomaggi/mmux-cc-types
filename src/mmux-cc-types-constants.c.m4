/*
  Part of: MMUX CC Types
  Contents: functions returning constant values
  Date: Oct 19, 2024

  Abstract

	This module implements functions returning constant values.

  Copyright (C) 2024, 2025 Marco Maggi <mrc.mgg@gmail.com>

  This program is free  software: you can redistribute it and/or  modify it under the
  terms  of  the  GNU General  Public  License  as  published  by the  Free  Software
  Foundation, either version 3 of the License, or (at your option) any later version.

  This program  is distributed in the  hope that it  will be useful, but  WITHOUT ANY
  WARRANTY; without  even the implied  warranty of  MERCHANTABILITY or FITNESS  FOR A
  PARTICULAR PURPOSE.  See the GNU General Public License for more details.

  You should have received  a copy of the GNU General Public  License along with this
  program.  If not, see <http://www.gnu.org/licenses/>.
*/


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <mmux-cc-types-internals.h>


/** --------------------------------------------------------------------
 ** Some maximum/minimum values.
 ** ----------------------------------------------------------------- */

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMF32]]],[[[
constexpr static const mmux_standard_flonumf32_t   mmux_libc_maximum_flonumf32=FLT32_MAX;
constexpr static const mmux_standard_flonumf32_t   mmux_libc_minimum_flonumf32=-(mmux_libc_maximum_flonumf32);
]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMF64]]],[[[
constexpr static const mmux_standard_flonumf64_t   mmux_libc_maximum_flonumf64=FLT64_MAX;
constexpr static const mmux_standard_flonumf64_t   mmux_libc_minimum_flonumf64=-(mmux_libc_maximum_flonumf64);
]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMF128]]],[[[
constexpr static const mmux_standard_flonumf128_t mmux_libc_maximum_flonumf128=FLT128_MAX;
constexpr static const mmux_standard_flonumf128_t mmux_libc_minimum_flonumf128=-(mmux_libc_maximum_flonumf128);
]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMF32X]]], [[[
constexpr static const mmux_standard_flonumf32x_t  mmux_libc_maximum_flonumf32x=FLT32X_MAX;
constexpr static const mmux_standard_flonumf32x_t  mmux_libc_minimum_flonumf32x=-(mmux_libc_maximum_flonumf32x);
]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMF64X]]], [[[
constexpr static const mmux_standard_flonumf64x_t  mmux_libc_maximum_flonumf64x=FLT64X_MAX;
constexpr static const mmux_standard_flonumf64x_t  mmux_libc_minimum_flonumf64x=-(mmux_libc_maximum_flonumf64);
]]])

MMUX_CONDITIONAL_CODE([[[MMUX_CC_TYPES_HAS_FLONUMF128X]]],[[[
constexpr static const mmux_standard_flonumf128x_t mmux_libc_maximum_flonumf128x=FLT128X_MAX;
constexpr static const mmux_standard_flonumf128x_t mmux_libc_minimum_flonumf128x=-(mmux_libc_maximum_flonumf128x);
]]])


/** --------------------------------------------------------------------
 ** Real number type functions: minimum, maximum.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - Stem of the type.
m4_dnl $2 - C language expression evaluating to the maximum value.
m4_dnl $3 - C language expression evaluating to the minimum value.
m4_dnl $4 - C preprocessor symbol used to exclude the code if the type is not supported.
m4_define([[[DEFINE_REAL_TYPE_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$4]]],[[[
mmux_standard_$1_t
mmux_standard_$1_constant_maximum (void)
{
  return $2;
}
mmux_standard_$1_t
mmux_standard_$1_constant_minimum (void)
{
  return $3;
}]]])]]])

DEFINE_REAL_TYPE_FUNCTIONS(char,	CHAR_MAX,	CHAR_MIN)
DEFINE_REAL_TYPE_FUNCTIONS(schar,	SCHAR_MAX,	SCHAR_MIN)
DEFINE_REAL_TYPE_FUNCTIONS(uchar,	UCHAR_MAX,	0)
DEFINE_REAL_TYPE_FUNCTIONS(sshort,	SHRT_MAX,	SHRT_MIN)
DEFINE_REAL_TYPE_FUNCTIONS(ushort,	USHRT_MAX,	0)
DEFINE_REAL_TYPE_FUNCTIONS(sint,	INT_MAX,	INT_MIN)
DEFINE_REAL_TYPE_FUNCTIONS(uint,	UINT_MAX,	0)
DEFINE_REAL_TYPE_FUNCTIONS(slong,	LONG_MAX,	LONG_MIN)
DEFINE_REAL_TYPE_FUNCTIONS(ulong,	ULONG_MAX,	0)
DEFINE_REAL_TYPE_FUNCTIONS(sllong,	LLONG_MAX,	LLONG_MIN,	[[[MMUX_CC_TYPES_HAS_SLLONG]]])
DEFINE_REAL_TYPE_FUNCTIONS(ullong,	ULLONG_MAX,	0,		[[[MMUX_CC_TYPES_HAS_ULLONG]]])

/* FIXME Should we do something to make available the "_MIN" constants defined by the
   C language standard?  (Marco Maggi; Sep 18, 2024) */
DEFINE_REAL_TYPE_FUNCTIONS(flonumfl,	FLT_MAX,	-FLT_MAX)
DEFINE_REAL_TYPE_FUNCTIONS(flonumdb,	DBL_MAX,	-DBL_MAX)
DEFINE_REAL_TYPE_FUNCTIONS(flonumldb,	LDBL_MAX,	-LDBL_MAX,	[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])

DEFINE_REAL_TYPE_FUNCTIONS(flonumf32, mmux_libc_maximum_flonumf32, mmux_libc_minimum_flonumf32, [[[MMUX_CC_TYPES_HAS_FLONUMF32]]])
DEFINE_REAL_TYPE_FUNCTIONS(flonumf64, mmux_libc_maximum_flonumf64, mmux_libc_minimum_flonumf64, [[[MMUX_CC_TYPES_HAS_FLONUMF64]]])
DEFINE_REAL_TYPE_FUNCTIONS(flonumf128,mmux_libc_maximum_flonumf128, mmux_libc_minimum_flonumf128, [[[MMUX_CC_TYPES_HAS_FLONUMF128]]])

DEFINE_REAL_TYPE_FUNCTIONS(flonumf32x, mmux_libc_maximum_flonumf32x, mmux_libc_minimum_flonumf32x, [[[MMUX_CC_TYPES_HAS_FLONUMF32X]]])
DEFINE_REAL_TYPE_FUNCTIONS(flonumf64x, mmux_libc_maximum_flonumf64x, mmux_libc_minimum_flonumf64x, [[[MMUX_CC_TYPES_HAS_FLONUMF64X]]])
DEFINE_REAL_TYPE_FUNCTIONS(flonumf128x,mmux_libc_maximum_flonumf128x, mmux_libc_minimum_flonumf128x, [[[MMUX_CC_TYPES_HAS_FLONUMF128X]]])

DEFINE_REAL_TYPE_FUNCTIONS(sint8,	INT8_MAX,	INT8_MIN)
DEFINE_REAL_TYPE_FUNCTIONS(uint8,	UINT8_MAX,	0)
DEFINE_REAL_TYPE_FUNCTIONS(sint16,	INT16_MAX,	INT16_MIN)
DEFINE_REAL_TYPE_FUNCTIONS(uint16,	UINT16_MAX,	0)
DEFINE_REAL_TYPE_FUNCTIONS(sint32,	INT32_MAX,	INT32_MIN)
DEFINE_REAL_TYPE_FUNCTIONS(uint32,	UINT32_MAX,	0)
DEFINE_REAL_TYPE_FUNCTIONS(sint64,	INT64_MAX,	INT64_MIN)
DEFINE_REAL_TYPE_FUNCTIONS(uint64,	UINT64_MAX,	0)


/** --------------------------------------------------------------------
 ** Real constants.
 ** ----------------------------------------------------------------- */

mmux_standard_flonumfl_t	mmux_standard_flonumfl_constant_nan	(void) { return nanf("nan(0)"); }
mmux_standard_flonumdb_t	mmux_standard_flonumdb_constant_nan	(void) { return nan("nan(0)"); }
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
mmux_standard_flonumldb_t	mmux_standard_flonumldb_constant_nan	(void) { return nanl("nan(0)"); }
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
mmux_standard_flonumf32_t	mmux_standard_flonumf32_constant_nan	(void) { return nanf32("nan(0)"); }
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
mmux_standard_flonumf64_t	mmux_standard_flonumf64_constant_nan	(void) { return nanf64("nan(0)"); }
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
mmux_standard_flonumf128_t	mmux_standard_flonumf128_constant_nan	(void) { return nanf128("nan(0)"); }
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
mmux_standard_flonumf32x_t	mmux_standard_flonumf32x_constant_nan	(void) { return nanf32x("nan(0)"); }
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
mmux_standard_flonumf64x_t	mmux_standard_flonumf64x_constant_nan	(void) { return nanf64x("nan(0)"); }
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
mmux_standard_flonumf128x_t	mmux_standard_flonumf128x_constant_nan	(void) { return nanf128x("nan(0)"); }
#endif

m4_divert(-1)
m4_define([[[DEFINE_MATH_REAL_CONSTANTS_FUNCS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[$1]]],[[[
mmux_standard_$1_t mmux_standard_$1_constant_E		(void) { return M_E$2; }
mmux_standard_$1_t mmux_standard_$1_constant_LOG2E	(void) { return M_LOG2E$2; }
mmux_standard_$1_t mmux_standard_$1_constant_LOG10E	(void) { return M_LOG10E$2; }
mmux_standard_$1_t mmux_standard_$1_constant_LN2	(void) { return M_LN2$2; }
mmux_standard_$1_t mmux_standard_$1_constant_LN10	(void) { return M_LN10$2; }
mmux_standard_$1_t mmux_standard_$1_constant_PI		(void) { return M_PI$2; }
mmux_standard_$1_t mmux_standard_$1_constant_PI_2	(void) { return M_PI_2$2; }
mmux_standard_$1_t mmux_standard_$1_constant_PI_4	(void) { return M_PI_4$2; }
mmux_standard_$1_t mmux_standard_$1_constant_1_PI	(void) { return M_1_PI$2; }
mmux_standard_$1_t mmux_standard_$1_constant_2_PI	(void) { return M_2_PI$2; }
mmux_standard_$1_t mmux_standard_$1_constant_2_SQRTPI	(void) { return M_2_SQRTPI$2; }
mmux_standard_$1_t mmux_standard_$1_constant_SQRT2	(void) { return M_SQRT2$2; }
mmux_standard_$1_t mmux_standard_$1_constant_SQRT1_2	(void) { return M_SQRT1_2$2; }
]]])]]])
m4_divert(0)m4_dnl
DEFINE_MATH_REAL_CONSTANTS_FUNCS(flonumfl)
DEFINE_MATH_REAL_CONSTANTS_FUNCS(flonumdb)
DEFINE_MATH_REAL_CONSTANTS_FUNCS(flonumldb,	l)
DEFINE_MATH_REAL_CONSTANTS_FUNCS(flonumf32,	f32)
DEFINE_MATH_REAL_CONSTANTS_FUNCS(flonumf64,	f64)
DEFINE_MATH_REAL_CONSTANTS_FUNCS(flonumf128,	f128)
DEFINE_MATH_REAL_CONSTANTS_FUNCS(flonumf32x,	f32x)
DEFINE_MATH_REAL_CONSTANTS_FUNCS(flonumf64x,	f64x)
DEFINE_MATH_REAL_CONSTANTS_FUNCS(flonumf128x,	f128x)

/* end of file */
