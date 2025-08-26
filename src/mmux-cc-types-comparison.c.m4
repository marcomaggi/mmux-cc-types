/*
  Part of: MMUX CC Types
  Contents: comparison functions
  Date: Aug 26, 2025

  Abstract

	This module implements comparison functions.

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
 ** Comparison core functions.
 ** ----------------------------------------------------------------- */

bool
mmux_pointer_equal (mmux_pointer_t op1, mmux_pointer_t op2)
{
  return (op1 == op2)? true : false;
}
mmux_sint_t
mmux_pointer_cmp (mmux_pointer_t op1, mmux_pointer_t op2)
{
  if (op1 > op2) {
    return mmux_sint(+1);
  } else if (op1 < op2) {
    return mmux_sint(-1);
  } else {
    return mmux_sint(0);
  }
}
bool mmux_pointer_greater       (mmux_pointer_t op1, mmux_pointer_t op2) { return (op1 >  op2)? true : false; }
bool mmux_pointer_less          (mmux_pointer_t op1, mmux_pointer_t op2) { return (op1 <  op2)? true : false; }
bool mmux_pointer_greater_equal (mmux_pointer_t op1, mmux_pointer_t op2) { return (op1 >= op2)? true : false; }
bool mmux_pointer_less_equal    (mmux_pointer_t op1, mmux_pointer_t op2) { return (op1 <= op2)? true : false; }

/* ------------------------------------------------------------------ */

#undef  DECL
#define DECL		__attribute__((__const__))

m4_define([[[DEFINE_COMPARISON_EQUAL_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
DECL bool mmux_$1_equal         (mmux_$1_t op1, mmux_$1_t op2) { return (op1.value == op2.value)? true : false; }
]]])]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_COMPARISON_INTEGER_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
DEFINE_COMPARISON_EQUAL_FUNCTIONS([[[$1]]],[[[$2]]])
DECL mmux_sint_t
mmux_$1_cmp (mmux_$1_t op1, mmux_$1_t op2)
{
  if (op1.value > op2.value) {
    return mmux_sint(+1);
  } else if (op1.value < op2.value) {
    return mmux_sint(-1);
  } else {
    return mmux_sint(0);
  }
}
DECL bool mmux_$1_greater       (mmux_$1_t op1, mmux_$1_t op2) { return (op1.value >  op2.value)? true : false; }
DECL bool mmux_$1_less          (mmux_$1_t op1, mmux_$1_t op2) { return (op1.value <  op2.value)? true : false; }
DECL bool mmux_$1_greater_equal (mmux_$1_t op1, mmux_$1_t op2) { return (op1.value >= op2.value)? true : false; }
DECL bool mmux_$1_less_equal    (mmux_$1_t op1, mmux_$1_t op2) { return (op1.value <= op2.value)? true : false; }
]]])]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_COMPARISON_FLONUMFL_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
DEFINE_COMPARISON_EQUAL_FUNCTIONS([[[$1]]],[[[$2]]])
DECL mmux_sint_t
mmux_$1_cmp (mmux_$1_t op1, mmux_$1_t op2)
{
  if (mmux_$1_greater(op1, op2)) {
    return mmux_sint(+1);
  } else if (mmux_$1_less(op1, op2)) {
    return mmux_sint(-1);
  } else {
    return mmux_sint(0);
  }
}
DECL bool mmux_$1_greater       (mmux_$1_t op1, mmux_$1_t op2) { return (     isgreater(op1.value,op2.value))? true : false; }
DECL bool mmux_$1_less          (mmux_$1_t op1, mmux_$1_t op2) { return (        isless(op1.value,op2.value))? true : false; }
DECL bool mmux_$1_greater_equal (mmux_$1_t op1, mmux_$1_t op2) { return (isgreaterequal(op1.value,op2.value))? true : false; }
DECL bool mmux_$1_less_equal    (mmux_$1_t op1, mmux_$1_t op2) { return (   islessequal(op1.value,op2.value))? true : false; }
]]])]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_COMPARISON_COMPLEX_FUNCTIONS]]],[[[MMUX_CONDITIONAL_CODE([[[$3]]],[[[
DEFINE_COMPARISON_EQUAL_FUNCTIONS([[[$1]]],[[[$3]]])
DECL mmux_sint_t
mmux_$1_cmp (mmux_$1_t op1, mmux_$1_t op2)
{
  return mmux_$2_cmp(mmux_$1_abs(op1), mmux_$1_abs(op2));
}
DECL bool
mmux_$1_greater (mmux_$1_t op1, mmux_$1_t op2)
{
  return mmux_$2_greater(mmux_$1_abs(op1), mmux_$1_abs(op2));
}
DECL bool
mmux_$1_less (mmux_$1_t op1, mmux_$1_t op2)
{
  return mmux_$2_less(mmux_$1_abs(op1), mmux_$1_abs(op2));
}
DECL bool
mmux_$1_greater_equal (mmux_$1_t op1, mmux_$1_t op2)
{
  return mmux_$2_greater_equal(mmux_$1_abs(op1), mmux_$1_abs(op2));
}
DECL bool
mmux_$1_less_equal (mmux_$1_t op1, mmux_$1_t op2)
{
  return mmux_$2_less_equal(mmux_$1_abs(op1), mmux_$1_abs(op2));
}
]]])]]])

/* ------------------------------------------------------------------ */

DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[char]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[schar]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[uchar]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[sshort]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[ushort]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[sint]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[uint]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[slong]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[ulong]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[sllong]]],		[[[MMUX_CC_TYPES_HAS_SLLONG]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[ullong]]],		[[[MMUX_CC_TYPES_HAS_ULLONG]]])

DEFINE_COMPARISON_FLONUMFL_FUNCTIONS([[[flonumfl]]])
DEFINE_COMPARISON_FLONUMFL_FUNCTIONS([[[flonumdb]]])
DEFINE_COMPARISON_FLONUMFL_FUNCTIONS([[[flonumldb]]],		[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])

DEFINE_COMPARISON_FLONUMFL_FUNCTIONS([[[flonumf32]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF32]]])
DEFINE_COMPARISON_FLONUMFL_FUNCTIONS([[[flonumf64]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF64]]])
DEFINE_COMPARISON_FLONUMFL_FUNCTIONS([[[flonumf128]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF128]]])

DEFINE_COMPARISON_FLONUMFL_FUNCTIONS([[[flonumf32x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF32X]]])
DEFINE_COMPARISON_FLONUMFL_FUNCTIONS([[[flonumf64x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF64X]]])
DEFINE_COMPARISON_FLONUMFL_FUNCTIONS([[[flonumf128x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMF128X]]])

DEFINE_COMPARISON_COMPLEX_FUNCTIONS([[[flonumcfl]]],	[[[flonumfl]]])
DEFINE_COMPARISON_COMPLEX_FUNCTIONS([[[flonumcdb]]],	[[[flonumdb]]])
DEFINE_COMPARISON_COMPLEX_FUNCTIONS([[[flonumcldb]]],	[[[flonumldb]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCLDB]]])

DEFINE_COMPARISON_COMPLEX_FUNCTIONS([[[flonumcf32]]],	[[[flonumf32]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF32]]])
DEFINE_COMPARISON_COMPLEX_FUNCTIONS([[[flonumcf64]]],	[[[flonumf64]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF64]]])
DEFINE_COMPARISON_COMPLEX_FUNCTIONS([[[flonumcf128]]],	[[[flonumf128]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF128]]])

DEFINE_COMPARISON_COMPLEX_FUNCTIONS([[[flonumcf32x]]],	[[[flonumf32x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF32X]]])
DEFINE_COMPARISON_COMPLEX_FUNCTIONS([[[flonumcf64x]]],	[[[flonumf64x]]],		[[[MMUX_CC_TYPES_HAS_FLONUMCF64X]]])
DEFINE_COMPARISON_COMPLEX_FUNCTIONS([[[flonumcf128x]]],	[[[flonumf128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF128X]]])

DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[sint8]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[uint8]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[sint16]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[uint16]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[sint32]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[uint32]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[sint64]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[uint64]]])

DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[usize]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[ssize]]])

DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[sintmax]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[uintmax]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[sintptr]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[uintptr]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[ptrdiff]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[mode]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[off]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[pid]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[uid]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[gid]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[wchar]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[wint]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[time]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[socklen]]])
DEFINE_COMPARISON_INTEGER_FUNCTIONS([[[rlim]]])


/** --------------------------------------------------------------------
 ** Approximate comparison functions for floating-point numbers.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - complex type stem
m4_dnl $2 - preprocessor symbol for conditional definition
m4_define([[[DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS]]],[[[MMUX_CONDITIONAL_CODE([[[$2]]],[[[
bool
mmux_$1_equal_absmargin (mmux_$1_t op1, mmux_$1_t op2, mmux_$1_t margin)
{
  return (mmux_$1_less_equal(mmux_$1_abs(mmux_$1_sub(op1,op2)), mmux_$1_abs(margin)))? true : false;
}
bool
mmux_$1_equal_relepsilon (mmux_$1_t op1, mmux_$1_t op2, mmux_$1_t epsilon)
{
  return (mmux_$1_less_equal(mmux_$1_abs(mmux_$1_sub(op1,op2)),
			     mmux_$1_mul(mmux_$1_abs(epsilon),
					 mmux_$1_max(mmux_$1_abs(op1),
						     mmux_$1_abs(op2)))))? true : false;
}
]]])]]])

/* ------------------------------------------------------------------ */

m4_dnl $1 - complex type stem
m4_dnl $2 - real part type stem
m4_dnl $3 - preprocessor symbol for conditional definition
m4_define([[[DEFINE_TYPE_FUNCTIONS_COMPLEX_FLONUMFL_APPROX_COMPARISONS]]],[[[MMUX_CONDITIONAL_CODE([[[$3]]],[[[
bool
mmux_$1_equal_absmargin (mmux_$1_t op1, mmux_$1_t op2, mmux_$1_t margin)
{
  mmux_$1_part_t	re1 = mmux_$1_real_part(op1);
  mmux_$1_part_t	im1 = mmux_$1_imag_part(op1);
  mmux_$1_part_t	re2 = mmux_$1_real_part(op2);
  mmux_$1_part_t	im2 = mmux_$1_imag_part(op2);
  mmux_$1_part_t	ret = mmux_$1_real_part(margin);
  mmux_$1_part_t	imt = mmux_$1_imag_part(margin);

  return (mmux_$2_equal_absmargin(re1, re2, ret) && mmux_$2_equal_absmargin(im1, im2, imt))? true : false;
}
bool
mmux_$1_equal_relepsilon (mmux_$1_t op1, mmux_$1_t op2, mmux_$1_t epsilon)
{
  mmux_$1_part_t	re1 = mmux_$1_real_part(op1);
  mmux_$1_part_t	im1 = mmux_$1_imag_part(op1);
  mmux_$1_part_t	re2 = mmux_$1_real_part(op2);
  mmux_$1_part_t	im2 = mmux_$1_imag_part(op2);
  mmux_$1_part_t	ret = mmux_$1_real_part(epsilon);
  mmux_$1_part_t	imt = mmux_$1_imag_part(epsilon);

  return (mmux_$2_equal_relepsilon(re1, re2, ret) && mmux_$2_equal_relepsilon(im1, im2, imt))? true : false;
}
]]])]]])

/* ------------------------------------------------------------------ */

DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS([[[flonumfl]]])
DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS([[[flonumdb]]])
DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS([[[flonumldb]]],	[[[MMUX_CC_TYPES_HAS_FLONUMLDB]]])

DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS([[[flonumf32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF32]]])
DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS([[[flonumf64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF64]]])
DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS([[[flonumf128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128]]])

DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS([[[flonumf32x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF32X]]])
DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS([[[flonumf64x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF64X]]])
DEFINE_TYPE_FUNCTIONS_REAL_FLOAT_APPROX_COMPARISONS([[[flonumf128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMF128X]]])

/* ------------------------------------------------------------------ */

DEFINE_TYPE_FUNCTIONS_COMPLEX_FLONUMFL_APPROX_COMPARISONS([[[flonumcfl]]],    [[[flonumfl]]])
DEFINE_TYPE_FUNCTIONS_COMPLEX_FLONUMFL_APPROX_COMPARISONS([[[flonumcdb]]],    [[[flonumdb]]])
DEFINE_TYPE_FUNCTIONS_COMPLEX_FLONUMFL_APPROX_COMPARISONS([[[flonumcldb]]],   [[[flonumldb]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCLDB]]])

DEFINE_TYPE_FUNCTIONS_COMPLEX_FLONUMFL_APPROX_COMPARISONS([[[flonumcf32]]],  [[[flonumf32]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF32]]])
DEFINE_TYPE_FUNCTIONS_COMPLEX_FLONUMFL_APPROX_COMPARISONS([[[flonumcf64]]],  [[[flonumf64]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF64]]])
DEFINE_TYPE_FUNCTIONS_COMPLEX_FLONUMFL_APPROX_COMPARISONS([[[flonumcf128]]], [[[flonumf128]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF128]]])

DEFINE_TYPE_FUNCTIONS_COMPLEX_FLONUMFL_APPROX_COMPARISONS([[[flonumcf32x]]], [[[flonumf32x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF32X]]])
DEFINE_TYPE_FUNCTIONS_COMPLEX_FLONUMFL_APPROX_COMPARISONS([[[flonumcf64x]]], [[[flonumf64x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF64X]]])
DEFINE_TYPE_FUNCTIONS_COMPLEX_FLONUMFL_APPROX_COMPARISONS([[[flonumcf128x]]],[[[flonumf128x]]],	[[[MMUX_CC_TYPES_HAS_FLONUMCF128X]]])

/* end of file */
