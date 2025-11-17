/*
  Part of: MMUX CC Types
  Contents: mathematical constants for floating-point types
  Date: Sep  1, 2025

  Abstract

	This  header   file  implements  mathematical  constants   for  the  standard
	floating-point.

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
 ** Constants: exact integers.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_EXACT_INTEGER_NUMERIC_CONSTANT_INLINE_FUNCTIONS]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_standard_$1_t
mmux_standard_$1_constant_$2 (void)
{
  return (mmux_standard_$1_t)($3);
}
mmux_cc_types_inline_decl mmux_$1_t
mmux_$1_constant_$2 (void)
{
  return mmux_$1(mmux_standard_$1_constant_$2());
}]]])

m4_define([[[DEFINE_EXACT_INTEGER_CONSTANT_INLINE_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[m4_dnl
mmux_cc_types_decl mmux_standard_$1_t mmux_standard_$1_constant_maximum (void)
  __attribute__((__const__));

mmux_cc_types_decl mmux_standard_$1_t mmux_standard_$1_constant_minimum (void)
  __attribute__((__const__));

mmux_cc_types_inline_decl mmux_$1_t
mmux_$1_constant_maximum (void)
{
  return mmux_$1(mmux_standard_$1_constant_maximum());
}
mmux_cc_types_inline_decl mmux_$1_t
mmux_$1_constant_minimum (void)
{
  return mmux_$1(mmux_standard_$1_constant_minimum());
}
mmux_cc_types_inline_decl mmux_usize_t
mmux_$1_constant_sizeof (void)
{
  return mmux_usize(sizeof(mmux_$1_t));
}
mmux_cc_types_inline_decl mmux_usize_t
mmux_$1_sizeof (void)
{
  return mmux_usize(sizeof(mmux_$1_t));
}

DEFINE_EXACT_INTEGER_NUMERIC_CONSTANT_INLINE_FUNCTIONS($1,	zero,	0)
DEFINE_EXACT_INTEGER_NUMERIC_CONSTANT_INLINE_FUNCTIONS($1,	one,	1)
DEFINE_EXACT_INTEGER_NUMERIC_CONSTANT_INLINE_FUNCTIONS($1,	two,	2)
DEFINE_EXACT_INTEGER_NUMERIC_CONSTANT_INLINE_FUNCTIONS($1,	ten,	10)
]]])]]])
m4_divert(0)m4_dnl
DEFINE_EXACT_INTEGER_CONSTANT_INLINE_FUNCTIONS(char)
DEFINE_EXACT_INTEGER_CONSTANT_INLINE_FUNCTIONS(schar)
DEFINE_EXACT_INTEGER_CONSTANT_INLINE_FUNCTIONS(uchar)
DEFINE_EXACT_INTEGER_CONSTANT_INLINE_FUNCTIONS(sshort)
DEFINE_EXACT_INTEGER_CONSTANT_INLINE_FUNCTIONS(ushort)
DEFINE_EXACT_INTEGER_CONSTANT_INLINE_FUNCTIONS(sint)
DEFINE_EXACT_INTEGER_CONSTANT_INLINE_FUNCTIONS(uint)
DEFINE_EXACT_INTEGER_CONSTANT_INLINE_FUNCTIONS(slong)
DEFINE_EXACT_INTEGER_CONSTANT_INLINE_FUNCTIONS(ulong)
DEFINE_EXACT_INTEGER_CONSTANT_INLINE_FUNCTIONS(sllong,	[[[MMUX_CC_TYPES_HAS_SLLONG]]])
DEFINE_EXACT_INTEGER_CONSTANT_INLINE_FUNCTIONS(ullong,	[[[MMUX_CC_TYPES_HAS_SLLONG]]])
DEFINE_EXACT_INTEGER_CONSTANT_INLINE_FUNCTIONS(sint8)
DEFINE_EXACT_INTEGER_CONSTANT_INLINE_FUNCTIONS(uint8)
DEFINE_EXACT_INTEGER_CONSTANT_INLINE_FUNCTIONS(sint16)
DEFINE_EXACT_INTEGER_CONSTANT_INLINE_FUNCTIONS(uint16)
DEFINE_EXACT_INTEGER_CONSTANT_INLINE_FUNCTIONS(sint32)
DEFINE_EXACT_INTEGER_CONSTANT_INLINE_FUNCTIONS(uint32)
DEFINE_EXACT_INTEGER_CONSTANT_INLINE_FUNCTIONS(sint64)
DEFINE_EXACT_INTEGER_CONSTANT_INLINE_FUNCTIONS(uint64)


/** --------------------------------------------------------------------
 ** Constants: exact integers aliased types.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_EXACT_INTEGER_SINGLE_ALIASED_TYPE_INLINE_FUNCTIONS]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_standard_$1_t
mmux_standard_$1_constant_$3 (void)
{
  return mmux_standard_$2_constant_$3();
}
mmux_cc_types_inline_decl mmux_$1_t
mmux_$1_constant_$3 (void)
{
  return mmux_$1(mmux_standard_$1_constant_$3());
}
]]])

m4_define([[[DEFINE_EXACT_INTEGER_ALIASED_TYPE_FUNCTIONS]]],[[[m4_dnl
DEFINE_EXACT_INTEGER_SINGLE_ALIASED_TYPE_INLINE_FUNCTIONS($1,	$2,	zero)
DEFINE_EXACT_INTEGER_SINGLE_ALIASED_TYPE_INLINE_FUNCTIONS($1,	$2,	one)
DEFINE_EXACT_INTEGER_SINGLE_ALIASED_TYPE_INLINE_FUNCTIONS($1,	$2,	two)
DEFINE_EXACT_INTEGER_SINGLE_ALIASED_TYPE_INLINE_FUNCTIONS($1,	$2,	ten)
DEFINE_EXACT_INTEGER_SINGLE_ALIASED_TYPE_INLINE_FUNCTIONS($1,	$2,	maximum)
DEFINE_EXACT_INTEGER_SINGLE_ALIASED_TYPE_INLINE_FUNCTIONS($1,	$2,	minimum)
mmux_cc_types_inline_decl mmux_usize_t
mmux_$1_constant_sizeof (void)
{
  return mmux_usize(sizeof(mmux_$1_t));

}
mmux_cc_types_inline_decl mmux_usize_t
mmux_$1_sizeof (void)
{
  return mmux_usize(sizeof(mmux_$1_t));
}]]])
m4_divert(0)m4_dnl
DEFINE_EXACT_INTEGER_ALIASED_TYPE_FUNCTIONS(byte,		MMUX_CC_TYPES_STEM_ALIAS_BYTE)
DEFINE_EXACT_INTEGER_ALIASED_TYPE_FUNCTIONS(octet,		MMUX_CC_TYPES_STEM_ALIAS_OCTET)
DEFINE_EXACT_INTEGER_ALIASED_TYPE_FUNCTIONS(ssize,		MMUX_CC_TYPES_STEM_ALIAS_SSIZE)
DEFINE_EXACT_INTEGER_ALIASED_TYPE_FUNCTIONS(usize,		MMUX_CC_TYPES_STEM_ALIAS_USIZE)
DEFINE_EXACT_INTEGER_ALIASED_TYPE_FUNCTIONS(sintmax,		MMUX_CC_TYPES_STEM_ALIAS_SINTMAX)
DEFINE_EXACT_INTEGER_ALIASED_TYPE_FUNCTIONS(uintmax,		MMUX_CC_TYPES_STEM_ALIAS_UINTMAX)
DEFINE_EXACT_INTEGER_ALIASED_TYPE_FUNCTIONS(sintptr,		MMUX_CC_TYPES_STEM_ALIAS_SINTPTR)
DEFINE_EXACT_INTEGER_ALIASED_TYPE_FUNCTIONS(uintptr,		MMUX_CC_TYPES_STEM_ALIAS_UINTPTR)
DEFINE_EXACT_INTEGER_ALIASED_TYPE_FUNCTIONS(libc_mode,		MMUX_CC_TYPES_STEM_ALIAS_LIBC_MODE)
DEFINE_EXACT_INTEGER_ALIASED_TYPE_FUNCTIONS(off,		MMUX_CC_TYPES_STEM_ALIAS_OFF)
DEFINE_EXACT_INTEGER_ALIASED_TYPE_FUNCTIONS(libc_pid,		MMUX_CC_TYPES_STEM_ALIAS_LIBC_PID)
DEFINE_EXACT_INTEGER_ALIASED_TYPE_FUNCTIONS(libc_uid,		MMUX_CC_TYPES_STEM_ALIAS_LIBC_UID)
DEFINE_EXACT_INTEGER_ALIASED_TYPE_FUNCTIONS(libc_gid,		MMUX_CC_TYPES_STEM_ALIAS_LIBC_GID)
DEFINE_EXACT_INTEGER_ALIASED_TYPE_FUNCTIONS(ptrdiff,		MMUX_CC_TYPES_STEM_ALIAS_PTRDIFF)
DEFINE_EXACT_INTEGER_ALIASED_TYPE_FUNCTIONS(wchar,		MMUX_CC_TYPES_STEM_ALIAS_WCHAR)
DEFINE_EXACT_INTEGER_ALIASED_TYPE_FUNCTIONS(wint,		MMUX_CC_TYPES_STEM_ALIAS_WINT)
DEFINE_EXACT_INTEGER_ALIASED_TYPE_FUNCTIONS(time,		MMUX_CC_TYPES_STEM_ALIAS_TIME)
DEFINE_EXACT_INTEGER_ALIASED_TYPE_FUNCTIONS(clock,		MMUX_CC_TYPES_STEM_ALIAS_CLOCK)
DEFINE_EXACT_INTEGER_ALIASED_TYPE_FUNCTIONS(libc_socklen,	MMUX_CC_TYPES_STEM_ALIAS_LIBC_SOCKLEN)
DEFINE_EXACT_INTEGER_ALIASED_TYPE_FUNCTIONS(libc_rlim,		MMUX_CC_TYPES_STEM_ALIAS_LIBC_RLIM)
DEFINE_EXACT_INTEGER_ALIASED_TYPE_FUNCTIONS(libc_ino,		MMUX_CC_TYPES_STEM_ALIAS_LIBC_INO)
DEFINE_EXACT_INTEGER_ALIASED_TYPE_FUNCTIONS(libc_dev,		MMUX_CC_TYPES_STEM_ALIAS_LIBC_DEV)
DEFINE_EXACT_INTEGER_ALIASED_TYPE_FUNCTIONS(libc_nlink,		MMUX_CC_TYPES_STEM_ALIAS_LIBC_NLINK)
DEFINE_EXACT_INTEGER_ALIASED_TYPE_FUNCTIONS(libc_blkcnt,	MMUX_CC_TYPES_STEM_ALIAS_LIBC_BLKCNT)


/** --------------------------------------------------------------------
 ** Constants: pointers.
 ** ----------------------------------------------------------------- */

mmux_cc_types_inline_decl mmux_pointer_t
mmux_standard_pointer_constant_zero (void)
{
  return NULL;
}
mmux_cc_types_inline_decl mmux_pointer_t
mmux_standard_pointer_constant_maximum (void)
{
  return (mmux_pointer_t)mmux_standard_uintptr_constant_maximum();
}
mmux_cc_types_inline_decl mmux_pointer_t
mmux_standard_pointer_constant_minimum (void)
{
  return (mmux_pointer_t)mmux_standard_uintptr_constant_minimum();
}

/* ------------------------------------------------------------------ */

mmux_cc_types_inline_decl mmux_pointer_t
mmux_pointer_constant_zero (void)
{
  return mmux_pointer(mmux_standard_pointer_constant_zero());
}
mmux_cc_types_inline_decl mmux_pointer_t
mmux_pointer_constant_maximum (void)
{
  return mmux_pointer(mmux_standard_pointer_constant_maximum());
}
mmux_cc_types_inline_decl mmux_pointer_t
mmux_pointer_constant_minimum (void)
{
  return mmux_pointer(mmux_standard_pointer_constant_minimum());
}
mmux_cc_types_inline_decl mmux_usize_t
mmux_pointer_constant_sizeof (void)
{
  return mmux_usize(sizeof(mmux_pointer_t));
}
mmux_cc_types_inline_decl mmux_usize_t
mmux_pointer_sizeof (void)
{
  return mmux_usize(sizeof(mmux_pointer_t));
}


/** --------------------------------------------------------------------
 ** Constants: standard flonum.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_STANDARD_FLONUM_NUMERIC_CONSTANT_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_standard_flonum$1_t
mmux_standard_flonum$1_constant_$2 (void)
{
  return mmux_standard_flonum$1_literal($3);
}]]])

m4_define([[[DEFINE_STANDARD_FLONUM_CONSTANT_PROTO]]],[[[m4_dnl
mmux_cc_types_decl mmux_cc_types_nullary_operation_standard_flonum$1_t mmux_standard_flonum$1_constant_$2
  __attribute__((__const__));]]])

m4_define([[[DEFINE_STANDARD_FLONUM_CONSTANTS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[
DEFINE_STANDARD_FLONUM_NUMERIC_CONSTANT_INLINE_FUNCTION($1,	zero,			+0.0)
DEFINE_STANDARD_FLONUM_NUMERIC_CONSTANT_INLINE_FUNCTION($1,	one,			1.0)
DEFINE_STANDARD_FLONUM_NUMERIC_CONSTANT_INLINE_FUNCTION($1,	two,			2.0)
DEFINE_STANDARD_FLONUM_NUMERIC_CONSTANT_INLINE_FUNCTION($1,	ten,			10.0)
DEFINE_STANDARD_FLONUM_NUMERIC_CONSTANT_INLINE_FUNCTION($1,	positive_zero,		+0.0)
DEFINE_STANDARD_FLONUM_NUMERIC_CONSTANT_INLINE_FUNCTION($1,	negative_zero,		-0.0)
DEFINE_STANDARD_FLONUM_NUMERIC_CONSTANT_INLINE_FUNCTION($1,	one_half,		0.5)

mmux_cc_types_inline_decl mmux_standard_flonum$1_t
mmux_standard_flonum$1_constant_one_third (void)
{
  /* FIXME There probably  is a better way  to compute this constant.  Or  the use of
     this constant.  (Marco Maggi; Sep 1, 2025) */
  return (mmux_standard_flonum$1_t)(mmux_standard_flonum$1_literal(1.0) / mmux_standard_flonum$1_literal(3.0));
}

DEFINE_STANDARD_FLONUM_CONSTANT_PROTO($1,		positive_infinity)
DEFINE_STANDARD_FLONUM_CONSTANT_PROTO($1,		negative_infinity)
DEFINE_STANDARD_FLONUM_CONSTANT_PROTO($1,		nan)
DEFINE_STANDARD_FLONUM_CONSTANT_PROTO($1,		E)
DEFINE_STANDARD_FLONUM_CONSTANT_PROTO($1,		LOG2E)
DEFINE_STANDARD_FLONUM_CONSTANT_PROTO($1,		LOG10E)
DEFINE_STANDARD_FLONUM_CONSTANT_PROTO($1,		LN2)
DEFINE_STANDARD_FLONUM_CONSTANT_PROTO($1,		LN10)
DEFINE_STANDARD_FLONUM_CONSTANT_PROTO($1,		PI)
DEFINE_STANDARD_FLONUM_CONSTANT_PROTO($1,		PI_2)
DEFINE_STANDARD_FLONUM_CONSTANT_PROTO($1,		PI_4)
DEFINE_STANDARD_FLONUM_CONSTANT_PROTO($1,		1_PI)
DEFINE_STANDARD_FLONUM_CONSTANT_PROTO($1,		2_PI)
DEFINE_STANDARD_FLONUM_CONSTANT_PROTO($1,		2_SQRTPI)
DEFINE_STANDARD_FLONUM_CONSTANT_PROTO($1,		SQRT2)
DEFINE_STANDARD_FLONUM_CONSTANT_PROTO($1,		SQRT1_2)

DEFINE_STANDARD_FLONUM_CONSTANT_PROTO($1,		minimum)
DEFINE_STANDARD_FLONUM_CONSTANT_PROTO($1,		maximum)
]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUM_CONSTANTS(fl)
DEFINE_STANDARD_FLONUM_CONSTANTS(db)
DEFINE_STANDARD_FLONUM_CONSTANTS(ldb)
DEFINE_STANDARD_FLONUM_CONSTANTS(f32)
DEFINE_STANDARD_FLONUM_CONSTANTS(f64)
DEFINE_STANDARD_FLONUM_CONSTANTS(f128)
DEFINE_STANDARD_FLONUM_CONSTANTS(f32x)
DEFINE_STANDARD_FLONUM_CONSTANTS(f64x)
DEFINE_STANDARD_FLONUM_CONSTANTS(f128x)


/** --------------------------------------------------------------------
 ** Constants: standard flonumc.
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_STANDARD_FLONUMC_REAL_NUMERIC_CONSTANT_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
mmux_standard_flonumc$1_constant_$2 (void)
{
  return mmux_standard_flonumc$1_rectangular(mmux_standard_flonum$1_constant_$2(),
					     mmux_standard_flonum$1_constant_zero());
}]]])

m4_define([[[DEFINE_STANDARD_FLONUMC_CPLX_NUMERIC_CONSTANT_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
mmux_standard_flonumc$1_constant_$2 (void)
{
  return mmux_standard_flonumc$1_rectangular(mmux_standard_flonum$1_constant_$2(),
					     mmux_standard_flonum$1_constant_$2());
}]]])

m4_define([[[DEFINE_STANDARD_FLONUMC_INFINITY_CONSTANT_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
mmux_standard_flonumc$1_constant_$2_$3_infinity (void)
{
  return mmux_standard_flonumc$1_rectangular(mmux_standard_flonum$1_constant_$2_infinity(),
					     mmux_standard_flonum$1_constant_$3_infinity());
}]]])

m4_define([[[DEFINE_STANDARD_FLONUMC_ZERO_CONSTANT_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
mmux_standard_flonumc$1_constant_$2_$3_zero (void)
{
  return mmux_standard_flonumc$1_rectangular(mmux_standard_flonum$1_constant_$2_zero(),
					     mmux_standard_flonum$1_constant_$3_zero());
}]]])

m4_define([[[DEFINE_STANDARD_FLONUMC_CONSTANTS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonumc$1]]],[[[
DEFINE_STANDARD_FLONUMC_REAL_NUMERIC_CONSTANT_INLINE_FUNCTION($1,	zero)
DEFINE_STANDARD_FLONUMC_REAL_NUMERIC_CONSTANT_INLINE_FUNCTION($1,	one)
DEFINE_STANDARD_FLONUMC_REAL_NUMERIC_CONSTANT_INLINE_FUNCTION($1,	two)
DEFINE_STANDARD_FLONUMC_REAL_NUMERIC_CONSTANT_INLINE_FUNCTION($1,	ten)
DEFINE_STANDARD_FLONUMC_REAL_NUMERIC_CONSTANT_INLINE_FUNCTION($1,	one_half)
DEFINE_STANDARD_FLONUMC_REAL_NUMERIC_CONSTANT_INLINE_FUNCTION($1,	one_third)
DEFINE_STANDARD_FLONUMC_CPLX_NUMERIC_CONSTANT_INLINE_FUNCTION($1,	maximum)
DEFINE_STANDARD_FLONUMC_CPLX_NUMERIC_CONSTANT_INLINE_FUNCTION($1,	minimum)

mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
mmux_standard_flonumc$1_constant_imag (void)
{
  return mmux_standard_flonumc$1_rectangular(mmux_standard_flonum$1_constant_zero(),
					     mmux_standard_flonum$1_constant_one());
}
mmux_cc_types_inline_decl mmux_standard_flonumc$1_t
mmux_standard_flonumc$1_constant_nan (void)
{
  return mmux_standard_flonumc$1_rectangular(mmux_standard_flonum$1_constant_nan(),
					     mmux_standard_flonum$1_constant_nan());
}

DEFINE_STANDARD_FLONUMC_INFINITY_CONSTANT_INLINE_FUNCTION($1,	positive,	positive)
DEFINE_STANDARD_FLONUMC_INFINITY_CONSTANT_INLINE_FUNCTION($1,	positive,	negative)
DEFINE_STANDARD_FLONUMC_INFINITY_CONSTANT_INLINE_FUNCTION($1,	negative,	positive)
DEFINE_STANDARD_FLONUMC_INFINITY_CONSTANT_INLINE_FUNCTION($1,	negative,	negative)

DEFINE_STANDARD_FLONUMC_ZERO_CONSTANT_INLINE_FUNCTION($1,	positive,	positive)
DEFINE_STANDARD_FLONUMC_ZERO_CONSTANT_INLINE_FUNCTION($1,	positive,	negative)
DEFINE_STANDARD_FLONUMC_ZERO_CONSTANT_INLINE_FUNCTION($1,	negative,	positive)
DEFINE_STANDARD_FLONUMC_ZERO_CONSTANT_INLINE_FUNCTION($1,	negative,	negative)
]]])]]])
m4_divert(0)m4_dnl
DEFINE_STANDARD_FLONUMC_CONSTANTS(fl)
DEFINE_STANDARD_FLONUMC_CONSTANTS(db)
DEFINE_STANDARD_FLONUMC_CONSTANTS(ldb)
DEFINE_STANDARD_FLONUMC_CONSTANTS(f32)
DEFINE_STANDARD_FLONUMC_CONSTANTS(f64)
DEFINE_STANDARD_FLONUMC_CONSTANTS(f128)
DEFINE_STANDARD_FLONUMC_CONSTANTS(f32x)
DEFINE_STANDARD_FLONUMC_CONSTANTS(f64x)
DEFINE_STANDARD_FLONUMC_CONSTANTS(f128x)


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#if ((defined MMUX_CC_TYPES_HAS_FLONUMD32) || \
     (defined MMUX_CC_TYPES_HAS_FLONUMD64) || \
     (defined MMUX_CC_TYPES_HAS_FLONUMD128))
#  include <mmux-cc-types-libdfp-constants.h>
#endif


/** --------------------------------------------------------------------
 ** Mathematics: flonum constants.
 ** ----------------------------------------------------------------- */

m4_divert(-1)
m4_define([[[DEFINE_FLONUM_CONSTANT_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_flonum$1_t
mmux_flonum$1_constant_$2 (void)
{
  return mmux_flonum$1(mmux_standard_flonum$1_constant_$2());
}]]])

m4_define([[[DEFINE_FLONUM_CONSTANTS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonum$1]]],[[[
DEFINE_FLONUM_CONSTANT_INLINE_FUNCTION($1,	zero)
DEFINE_FLONUM_CONSTANT_INLINE_FUNCTION($1,	one)
DEFINE_FLONUM_CONSTANT_INLINE_FUNCTION($1,	two)
DEFINE_FLONUM_CONSTANT_INLINE_FUNCTION($1,	ten)
DEFINE_FLONUM_CONSTANT_INLINE_FUNCTION($1,	one_half)
DEFINE_FLONUM_CONSTANT_INLINE_FUNCTION($1,	one_third)
DEFINE_FLONUM_CONSTANT_INLINE_FUNCTION($1,	positive_zero)
DEFINE_FLONUM_CONSTANT_INLINE_FUNCTION($1,	negative_zero)
DEFINE_FLONUM_CONSTANT_INLINE_FUNCTION($1,	positive_infinity)
DEFINE_FLONUM_CONSTANT_INLINE_FUNCTION($1,	negative_infinity)
DEFINE_FLONUM_CONSTANT_INLINE_FUNCTION($1,	maximum)
DEFINE_FLONUM_CONSTANT_INLINE_FUNCTION($1,	minimum)
DEFINE_FLONUM_CONSTANT_INLINE_FUNCTION($1,	nan)
DEFINE_FLONUM_CONSTANT_INLINE_FUNCTION($1,	E)
DEFINE_FLONUM_CONSTANT_INLINE_FUNCTION($1,	LOG2E)
DEFINE_FLONUM_CONSTANT_INLINE_FUNCTION($1,	LOG10E)
DEFINE_FLONUM_CONSTANT_INLINE_FUNCTION($1,	LN2)
DEFINE_FLONUM_CONSTANT_INLINE_FUNCTION($1,	LN10)
DEFINE_FLONUM_CONSTANT_INLINE_FUNCTION($1,	PI)
DEFINE_FLONUM_CONSTANT_INLINE_FUNCTION($1,	PI_2)
DEFINE_FLONUM_CONSTANT_INLINE_FUNCTION($1,	PI_4)
DEFINE_FLONUM_CONSTANT_INLINE_FUNCTION($1,	1_PI)
DEFINE_FLONUM_CONSTANT_INLINE_FUNCTION($1,	2_PI)
DEFINE_FLONUM_CONSTANT_INLINE_FUNCTION($1,	2_SQRTPI)
DEFINE_FLONUM_CONSTANT_INLINE_FUNCTION($1,	SQRT2)
DEFINE_FLONUM_CONSTANT_INLINE_FUNCTION($1,	SQRT1_2)

mmux_cc_types_inline_decl mmux_usize_t
mmux_flonum$1_constant_sizeof (void)
{
  return mmux_usize(sizeof(mmux_flonum$1_t));
}
mmux_cc_types_inline_decl mmux_usize_t
mmux_flonum$1_sizeof (void)
{
  return mmux_usize(sizeof(mmux_flonum$1_t));
}
]]])]]])
m4_divert(0)m4_dnl
DEFINE_FLONUM_CONSTANTS(fl)
DEFINE_FLONUM_CONSTANTS(db)
DEFINE_FLONUM_CONSTANTS(ldb)
DEFINE_FLONUM_CONSTANTS(f32)
DEFINE_FLONUM_CONSTANTS(f64)
DEFINE_FLONUM_CONSTANTS(f128)
DEFINE_FLONUM_CONSTANTS(f32x)
DEFINE_FLONUM_CONSTANTS(f64x)
DEFINE_FLONUM_CONSTANTS(f128x)
DEFINE_FLONUM_CONSTANTS(d32)
DEFINE_FLONUM_CONSTANTS(d64)
DEFINE_FLONUM_CONSTANTS(d128)


/** --------------------------------------------------------------------
 ** Mathematics: flonumc constants.
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_FLONUMC_CONSTANT_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_flonumc$1_t
mmux_flonumc$1_constant_$2 (void)
{
  return (mmux_flonumc$1_t) { .value = mmux_standard_flonumc$1_constant_$2() };
}]]])

m4_define([[[DEFINE_FLONUMC_INFINITY_CONSTANT_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_flonumc$1_t
mmux_flonumc$1_constant_$2_$3_infinity (void)
{
  return (mmux_flonumc$1_t) { .value = mmux_standard_flonumc$1_constant_$2_$3_infinity() };
}]]])

m4_define([[[DEFINE_FLONUMC_ZERO_CONSTANT_INLINE_FUNCTION]]],[[[m4_dnl
mmux_cc_types_inline_decl mmux_flonumc$1_t
mmux_flonumc$1_constant_$2_$3_zero (void)
{
  return (mmux_flonumc$1_t) { .value = mmux_standard_flonumc$1_constant_$2_$3_zero() };
}]]])

m4_define([[[DEFINE_FLONUMC_CONSTANTS]]],[[[MMUX_CONDITIONAL_CODE_FOR_TYPE_STEM([[[flonumc$1]]],[[[
DEFINE_FLONUMC_CONSTANT_INLINE_FUNCTION($1,	nan)
DEFINE_FLONUMC_CONSTANT_INLINE_FUNCTION($1,	imag)
DEFINE_FLONUMC_CONSTANT_INLINE_FUNCTION($1,	zero)
DEFINE_FLONUMC_CONSTANT_INLINE_FUNCTION($1,	one)
DEFINE_FLONUMC_CONSTANT_INLINE_FUNCTION($1,	two)
DEFINE_FLONUMC_CONSTANT_INLINE_FUNCTION($1,	ten)
DEFINE_FLONUMC_CONSTANT_INLINE_FUNCTION($1,	one_half)
DEFINE_FLONUMC_CONSTANT_INLINE_FUNCTION($1,	one_third)
DEFINE_FLONUMC_CONSTANT_INLINE_FUNCTION($1,	maximum)
DEFINE_FLONUMC_CONSTANT_INLINE_FUNCTION($1,	minimum)

DEFINE_FLONUMC_INFINITY_CONSTANT_INLINE_FUNCTION($1,	positive,	positive)
DEFINE_FLONUMC_INFINITY_CONSTANT_INLINE_FUNCTION($1,	positive,	negative)
DEFINE_FLONUMC_INFINITY_CONSTANT_INLINE_FUNCTION($1,	negative,	positive)
DEFINE_FLONUMC_INFINITY_CONSTANT_INLINE_FUNCTION($1,	negative,	negative)

DEFINE_FLONUMC_ZERO_CONSTANT_INLINE_FUNCTION($1,	positive,	positive)
DEFINE_FLONUMC_ZERO_CONSTANT_INLINE_FUNCTION($1,	positive,	negative)
DEFINE_FLONUMC_ZERO_CONSTANT_INLINE_FUNCTION($1,	negative,	positive)
DEFINE_FLONUMC_ZERO_CONSTANT_INLINE_FUNCTION($1,	negative,	negative)

mmux_cc_types_inline_decl mmux_usize_t
mmux_flonumc$1_constant_sizeof (void)
{
  return mmux_usize(sizeof(mmux_flonumc$1_t));
}
mmux_cc_types_inline_decl mmux_usize_t
mmux_flonumc$1_sizeof (void)
{
  return mmux_usize(sizeof(mmux_flonumc$1_t));
}
]]])]]])
m4_divert(0)m4_dnl
DEFINE_FLONUMC_CONSTANTS(fl)
DEFINE_FLONUMC_CONSTANTS(db)
DEFINE_FLONUMC_CONSTANTS(ldb)
DEFINE_FLONUMC_CONSTANTS(f32)
DEFINE_FLONUMC_CONSTANTS(f64)
DEFINE_FLONUMC_CONSTANTS(f128)
DEFINE_FLONUMC_CONSTANTS(f32x)
DEFINE_FLONUMC_CONSTANTS(f64x)
DEFINE_FLONUMC_CONSTANTS(f128x)
DEFINE_FLONUMC_CONSTANTS(d32)
DEFINE_FLONUMC_CONSTANTS(d64)
DEFINE_FLONUMC_CONSTANTS(d128)


/** --------------------------------------------------------------------
 ** Constants: generic macros.
 ** ----------------------------------------------------------------- */

m4_divert(-1)

m4_define([[[DEFINE_CONSTANT_GENERIC_MACRO]]],[[[m4_dnl
#define mmux_ctype_constant_$1(VALUE)						\
  (_Generic((VALUE),								\
	   mmux_char_t:			mmux_char_constant_$1,			\
           mmux_schar_t:		mmux_schar_constant_$1,			\
           mmux_uchar_t:		mmux_uchar_constant_$1,			\
           mmux_sshort_t:		mmux_sshort_constant_$1,		\
           mmux_ushort_t:		mmux_ushort_constant_$1,		\
           mmux_sint_t:			mmux_sint_constant_$1,			\
           mmux_uint_t:			mmux_uint_constant_$1,			\
           mmux_slong_t:		mmux_slong_constant_$1,			\
           mmux_ulong_t:		mmux_ulong_constant_$1,			\
m4_ifelse(MMUX_CC_TYPES_HAS_SLLONG_M4,1,[[[m4_dnl
	   mmux_sllong_t:		mmux_sllong_constant_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_ULLONG_M4,1,[[[m4_dnl
	   mmux_ullong_t:		mmux_ullong_constant_$1,		\
]]])m4_dnl
           mmux_flonumfl_t:		mmux_flonumfl_constant_$1,		\
	   mmux_flonumdb_t:		mmux_flonumdb_constant_$1,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMLDB_M4,1,[[[m4_dnl
	   mmux_flonumldb_t:		mmux_flonumldb_constant_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32_M4,1,[[[m4_dnl
	   mmux_flonumf32_t:		mmux_flonumf32_constant_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64_M4,1,[[[m4_dnl
	   mmux_flonumf64_t:		mmux_flonumf64_constant_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128_M4,1,[[[m4_dnl
	   mmux_flonumf128_t:		mmux_flonumf128_constant_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF32X_M4,1,[[[m4_dnl
	   mmux_flonumf32x_t:		mmux_flonumf32x_constant_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF64X_M4,1,[[[m4_dnl
	   mmux_flonumf64x_t:		mmux_flonumf64x_constant_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMF128X_M4,1,[[[m4_dnl
	   mmux_flonumf128x_t:		mmux_flonumf128x_constant_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD32_M4,1,[[[m4_dnl
	   mmux_flonumd32_t:		mmux_flonumd32_constant_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD64_M4,1,[[[m4_dnl
	   mmux_flonumd64_t:		mmux_flonumd64_constant_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMD128_M4,1,[[[m4_dnl
	   mmux_flonumd128_t:		mmux_flonumd128_constant_$1,		\
]]])m4_dnl
	   mmux_flonumcfl_t:		mmux_flonumcfl_constant_$1,		\
	   mmux_flonumcdb_t:		mmux_flonumcdb_constant_$1,		\
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCLDB_M4,1,[[[m4_dnl
	   mmux_flonumcldb_t:		mmux_flonumcldb_constant_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32_M4,1,[[[m4_dnl
	   mmux_flonumcf32_t:		mmux_flonumcf32_constant_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64_M4,1,[[[m4_dnl
	   mmux_flonumcf64_t:		mmux_flonumcf64_constant_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128_M4,1,[[[m4_dnl
	   mmux_flonumcf128_t:		mmux_flonumcf128_constant_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF32X_M4,1,[[[m4_dnl
	   mmux_flonumcf32x_t:		mmux_flonumcf32x_constant_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF64X_M4,1,[[[m4_dnl
	   mmux_flonumcf64x_t:		mmux_flonumcf64x_constant_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCF128X_M4,1,[[[m4_dnl
	   mmux_flonumcf128x_t:		mmux_flonumcf128x_constant_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD32_M4,1,[[[m4_dnl
	   mmux_flonumcd32_t:		mmux_flonumcd32_constant_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD64_M4,1,[[[m4_dnl
	   mmux_flonumcd64_t:		mmux_flonumcd64_constant_$1,		\
]]])m4_dnl
m4_ifelse(MMUX_CC_TYPES_HAS_FLONUMCD128_M4,1,[[[m4_dnl
	   mmux_flonumcd128_t:		mmux_flonumcd128_constant_$1,		\
]]])m4_dnl
	   mmux_sint8_t:		mmux_sint8_constant_$1,			\
	   mmux_uint8_t:		mmux_uint8_constant_$1,			\
	   mmux_sint16_t:		mmux_sint16_constant_$1,		\
	   mmux_uint16_t:		mmux_uint16_constant_$1,		\
	   mmux_sint32_t:		mmux_sint32_constant_$1,		\
	   mmux_uint32_t:		mmux_uint32_constant_$1,		\
	   mmux_sint64_t:		mmux_sint64_constant_$1,		\
	   mmux_uint64_t:		mmux_uint64_constant_$1,		\
	   mmux_byte_t:			mmux_byte_constant_$1,			\
	   mmux_octet_t:		mmux_octet_constant_$1,			\
           mmux_ssize_t:		mmux_ssize_constant_$1,			\
           mmux_usize_t:		mmux_usize_constant_$1,			\
           mmux_sintmax_t:		mmux_sintmax_constant_$1,		\
           mmux_uintmax_t:		mmux_uintmax_constant_$1,		\
           mmux_sintptr_t:		mmux_sintptr_constant_$1,		\
           mmux_uintptr_t:		mmux_uintptr_constant_$1,		\
           mmux_libc_mode_t:		mmux_libc_mode_constant_$1,		\
           mmux_off_t:			mmux_off_constant_$1,			\
           mmux_libc_pid_t:		mmux_libc_pid_constant_$1,		\
           mmux_libc_uid_t:		mmux_libc_uid_constant_$1,		\
           mmux_libc_gid_t:		mmux_libc_gid_constant_$1,		\
           mmux_ptrdiff_t:		mmux_ptrdiff_constant_$1,		\
           mmux_wchar_t:		mmux_wchar_constant_$1,			\
           mmux_wint_t:			mmux_wint_constant_$1,			\
           mmux_time_t:			mmux_time_constant_$1,			\
           mmux_clock_t:		mmux_clock_constant_$1,			\
           mmux_libc_socklen_t:		mmux_libc_socklen_constant_$1,		\
           mmux_libc_rlim_t:		mmux_libc_rlim_constant_$1,		\
           mmux_libc_ino_t:		mmux_libc_ino_constant_$1,		\
           mmux_libc_dev_t:		mmux_libc_dev_constant_$1,		\
           mmux_libc_nlink_t:		mmux_libc_nlink_constant_$1,		\
           mmux_libc_blkcnt_t:		mmux_libc_blkcnt_constant_$1)())
]]])

m4_divert(0)m4_dnl

DEFINE_CONSTANT_GENERIC_MACRO([[[zero]]])
DEFINE_CONSTANT_GENERIC_MACRO([[[one]]])


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */


/* end of file */
