/*
  Part of: MMUX Bash Pointers
  Contents: implementation of complex numbers builtins
  Date: Sep 29, 2024

  Abstract

	This module implements complex numbers builtins.

  Copyright (C) 2024 Marco Maggi <mrc.mgg@gmail.com>

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

#include "mmux-bash-pointers-internals.h"


/** --------------------------------------------------------------------
 ** Basic complex numbers builtins: make_rectangular, real_part, imag_part, abs, arg, conj.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - complex number stem
m4_dnl $2 - stem of real and imaginary parts
m4_dnl $3 - conditional inclusion C preprocessor symbol
m4_define([[[DEFINE_CORE_COMPLEX_BUILTINS]]],[[[
static int
mmux_$1_make_rectangular_main (int argc MMUX_BASH_POINTERS_UNUSED,  char const * const argv[] MMUX_BASH_POINTERS_UNUSED)
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_make_rectangular"
{
MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[
  mmux_$2_t	rep, imp;
  mmux_$1_t	Z;
  int			rv;

  rv = mmux_$2_parse(&rep, argv[2], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { goto error; }

  rv = mmux_$2_parse(&imp, argv[3], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { goto error; }

  Z = mmux_$1_make_rectangular(rep, imp);

  return mmux_$1_bind_to_variable(argv[1], Z, MMUX_BUILTIN_NAME);
error:
  mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME);
  return rv;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_make_rectangular]]],
    [[[(4 == argc)]]],
    [[["mmux_$1_make_rectangular ROPVAR REP IMP"]]],
    [[["Construc a complex number given its real and imaginary parts, store the result in ROPVAR."]]])

/* ------------------------------------------------------------------ */

static int
mmux_$1_real_part_main (int argc MMUX_BASH_POINTERS_UNUSED,  char const * const argv[] MMUX_BASH_POINTERS_UNUSED)
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_real_part"
{
MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[
  mmux_$2_t	part;
  mmux_$1_t	Z;
  int			rv;

  rv = mmux_$1_parse(&Z, argv[2], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { goto error; }

  part = mmux_$1_real_part(Z);

  return mmux_$2_bind_to_variable(argv[1], part, MMUX_BUILTIN_NAME);
error:
  mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME);
  return rv;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_real_part]]],
    [[[(3 == argc)]]],
    [[["mmux_$1_real_part ROPVAR CPLX"]]],
    [[["Extract the real part of CPLX, store the result in ROPVAR."]]])

/* ------------------------------------------------------------------ */

static int
mmux_$1_imag_part_main (int argc MMUX_BASH_POINTERS_UNUSED,  char const * const argv[] MMUX_BASH_POINTERS_UNUSED)
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_imag_part"
{
MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[
  mmux_$2_t	part;
  mmux_$1_t	Z;
  int			rv;

  rv = mmux_$1_parse(&Z, argv[2], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { goto error; }

  part = mmux_$1_imag_part(Z);

  return mmux_$2_bind_to_variable(argv[1], part, MMUX_BUILTIN_NAME);
error:
  mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME);
  return rv;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_imag_part]]],
    [[[(3 == argc)]]],
    [[["mmux_$1_imag_part ROPVAR CPLX"]]],
    [[["Extract the imaginary part of CPLX, store the result in ROPVAR."]]])

/* ------------------------------------------------------------------ */

static int
mmux_$1_abs_main (int argc MMUX_BASH_POINTERS_UNUSED,  char const * const argv[] MMUX_BASH_POINTERS_UNUSED)
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_abs"
{
MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[
  mmux_$2_t	part;
  mmux_$1_t	Z;
  int			rv;

  rv = mmux_$1_parse(&Z, argv[2], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { goto error; }

  part = mmux_$1_abs(Z);

  return mmux_$2_bind_to_variable(argv[1], part, MMUX_BUILTIN_NAME);
error:
  mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME);
  return rv;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_abs]]],
    [[[(3 == argc)]]],
    [[["mmux_$1_abs ROPVAR CPLX"]]],
    [[["Extract the absolute value of CPLX, store the result in ROPVAR."]]])

/* ------------------------------------------------------------------ */

static int
mmux_$1_arg_main (int argc MMUX_BASH_POINTERS_UNUSED,  char const * const argv[] MMUX_BASH_POINTERS_UNUSED)
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_arg"
{
MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[
  mmux_$2_t	part;
  mmux_$1_t	Z;
  int			rv;

  rv = mmux_$1_parse(&Z, argv[2], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { goto error; }

  part = mmux_$1_arg(Z);

  return mmux_$2_bind_to_variable(argv[1], part, MMUX_BUILTIN_NAME);
error:
  mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME);
  return rv;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_arg]]],
    [[[(3 == argc)]]],
    [[["mmux_$1_arg ROPVAR CPLX"]]],
    [[["Extract the argument value of CPLX, store the result in ROPVAR."]]])

/* ------------------------------------------------------------------ */

static int
mmux_$1_conj_main (int argc MMUX_BASH_POINTERS_UNUSED,  char const * const argv[] MMUX_BASH_POINTERS_UNUSED)
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_$1_conj"
{
MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[
  mmux_$1_t	Z, Zconj;
  int			rv;

  rv = mmux_$1_parse(&Z, argv[2], MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != rv) { goto error; }

  Zconj = mmux_$1_conj(Z);

  return mmux_$1_bind_to_variable(argv[1], Zconj, MMUX_BUILTIN_NAME);
error:
  mmux_bash_pointers_set_ERRNO(EINVAL, MMUX_BUILTIN_NAME);
  return rv;
]]],[[[
  fprintf(stderr, "MMUX Bash Pointers: error: builtin \"%s\" not implemented because underlying C language type not available.\n",
	  MMUX_BUILTIN_NAME);
  return MMUX_FAILURE;
]]])
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_$1_conj]]],
    [[[(3 == argc)]]],
    [[["mmux_$1_conj ROPVAR CPLX"]]],
    [[["Compute the conjugate value of CPLX, store the result in ROPVAR."]]])

]]])

/* ------------------------------------------------------------------ */

DEFINE_CORE_COMPLEX_BUILTINS([[[complexf]]],		[[[float]]])
DEFINE_CORE_COMPLEX_BUILTINS([[[complexd]]],		[[[double]]])
DEFINE_CORE_COMPLEX_BUILTINS([[[complexld]]],		[[[ldouble]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXLD]]])

DEFINE_CORE_COMPLEX_BUILTINS([[[complexf32]]],		[[[float32]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXF32]]])
DEFINE_CORE_COMPLEX_BUILTINS([[[complexf64]]],		[[[float64]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXF64]]])
DEFINE_CORE_COMPLEX_BUILTINS([[[complexf128]]],		[[[float128]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXF128]]])

DEFINE_CORE_COMPLEX_BUILTINS([[[complexf32x]]],		[[[float32x]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXF32X]]])
DEFINE_CORE_COMPLEX_BUILTINS([[[complexf64x]]],		[[[float64x]]],		[[[MMUX_HAVE_CC_TYPE_COMPLEXF64X]]])
DEFINE_CORE_COMPLEX_BUILTINS([[[complexf128x]]],	[[[float128x]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXF128X]]])

DEFINE_CORE_COMPLEX_BUILTINS([[[complexd32]]],		[[[decimal32]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD32]]])
DEFINE_CORE_COMPLEX_BUILTINS([[[complexd64]]],		[[[decimal64]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD64]]])
DEFINE_CORE_COMPLEX_BUILTINS([[[complexd128]]],		[[[decimal128]]],	[[[MMUX_HAVE_CC_TYPE_COMPLEXD128]]])

/* end of file */
