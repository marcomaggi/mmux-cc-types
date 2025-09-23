/*
  Part of: MMUX CC Tests
  Contents: test file for code examples in the documentation
  Date: Sep 14, 2025

  Abstract

	Test file for code examples in the documentation.

  Copyright (C) 2025 Marco Maggi <mrc.mgg@gmail.com>

  See the COPYING file.
*/


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <test-common.h>


static void
test_real_numbers (void)
{
  dprintf(2, "%s: enter\n", __func__);

  {
    dprintf(2, "%s: compute the sign of a number\n", __func__);
    {
      mmux_flonumf128_t  A = mmux_flonumf128_literal(0.123);
      mmux_flonumf128_t  S = mmux_flonumf128_sign(A);

      mmux_flonumf128_dprintf(2, S); dprintf_newline(2);
    }
    dprintf(2, "%s: generically compute the sign of a number\n", __func__);
    {
      auto  A = mmux_flonumf128_literal(0.123);
      auto  S = mmux_ctype_sign(A);

      mmux_ctype_dprintf(2, S); dprintf_newline(2);
    }
  }

/* ------------------------------------------------------------------ */

  {
    dprintf(2, "%s: compute the ceil of a number\n", __func__);
    {
      mmux_flonumf128_t  A = mmux_flonumf128_literal(0.123);
      mmux_flonumf128_t  S = mmux_flonumf128_ceil(A);

      mmux_flonumf128_dprintf(2, S); dprintf_newline(2);
    }
    dprintf(2, "%s: generically compute the ceil of a number\n", __func__);
    {
      auto  A = mmux_flonumf128_literal(0.123);
      auto  S = mmux_ctype_ceil(A);

      mmux_ctype_dprintf(2, S); dprintf_newline(2);
    }
  }

/* ------------------------------------------------------------------ */

  {
    dprintf(2, "%s: round to integer a floating-point number\n", __func__);
    {
      mmux_flonumf128_t	A = mmux_flonumf128_literal(123.456);
      mmux_slong_t	B = mmux_flonumf128_lrint(A);

      mmux_slong_dprintf(2, B); dprintf_newline(2);
    }
    dprintf(2, "%s: generically round to integer a floating-point number\n", __func__);
    {
      auto	A = mmux_flonumf128_literal(123.456);
      auto	B = mmux_ctype_lrint(A);

      mmux_ctype_dprintf(2, B); dprintf_newline(2);
    }
  }

/* ------------------------------------------------------------------ */

  {
    dprintf(2, "%s: split a floating-point number into integer and fractional parts\n", __func__);
    {
      mmux_flonumf128_t	A = mmux_flonumf128_literal(123.456);
      mmux_flonumf128_t	integer_of_A;
      mmux_flonumf128_t	fractional_of_A = mmux_flonumf128_modf(A, &integer_of_A);

      mmux_flonumf128_dprintf(2, integer_of_A); dprintf_newline(2);
      mmux_flonumf128_dprintf(2, fractional_of_A); dprintf_newline(2);
    }
    dprintf(2, "%s: generically split a floating-point number into integer and fractional parts\n", __func__);
    {
      auto	A = mmux_flonumf128_literal(123.456);
      typeof(A)	integer_of_A;
      auto	fractional_of_A = mmux_ctype_modf(A, &integer_of_A);

      mmux_ctype_dprintf(2, integer_of_A); dprintf_newline(2);
      mmux_ctype_dprintf(2, fractional_of_A); dprintf_newline(2);
    }
  }

  dprintf(2, "%s: leave\n", __func__);
}


static void
test_complex_numbers (void)
{
  dprintf(2, "%s: enter\n", __func__);

  {
    dprintf(2, "%s: compute the real and imag parts of a complex number\n", __func__);
    {
      mmux_flonumcf64_t  Z   = mmux_flonumcf64_rectangular_literal(1.2,3.4);
      mmux_flonumf64_t   Zre = mmux_flonumcf64_real_part(Z);
      mmux_flonumf64_t   Zim = mmux_flonumcf64_imag_part(Z);

      mmux_flonumf64_dprintf(2, Zre); dprintf_newline(2);
      mmux_flonumf64_dprintf(2, Zim); dprintf_newline(2);
    }
    dprintf(2, "%s: generically compute the real part of a complex number\n", __func__);
    {
      auto	Z   = mmux_flonumcf64_rectangular_literal(1.2,3.4);
      auto	Zre = mmux_ctype_real_part(Z);
      auto	Zim = mmux_ctype_imag_part(Z);

      mmux_ctype_dprintf(2, Zre); dprintf_newline(2);
      mmux_ctype_dprintf(2, Zim); dprintf_newline(2);
    }
    dprintf(2, "%s: compute the real and imag parts of a real number\n", __func__);
    {
      mmux_flonumf64_t   Z   = mmux_flonumf64_literal(0.123);
      mmux_flonumf64_t   Zre = mmux_flonumf64_real_part(Z);
      mmux_flonumf64_t   Zim = mmux_flonumf64_imag_part(Z);

      mmux_flonumf64_dprintf(2, Zre); dprintf_newline(2);
      mmux_flonumf64_dprintf(2, Zim); dprintf_newline(2);
    }
    dprintf(2, "%s: generically compute the real part of a real number\n", __func__);
    {
      auto	Z   = mmux_flonumf64_literal(0.123);
      auto	Zre = mmux_ctype_real_part(Z);
      auto	Zim = mmux_ctype_imag_part(Z);

      mmux_ctype_dprintf(2, Zre); dprintf_newline(2);
      mmux_ctype_dprintf(2, Zim); dprintf_newline(2);
    }
  }

/* ------------------------------------------------------------------ */

  {
    dprintf(2, "%s: compute the complex argument of a complex number\n", __func__);
    {
      mmux_flonumcf64_t  Z = mmux_flonumcf64_rectangular_literal(1.2,3.4);
      mmux_flonumf64_t   A = mmux_flonumcf64_argument(Z);

      mmux_flonumf64_dprintf(2, A);
      dprintf_newline(2);
    }

    dprintf(2, "%s: generically compute the complex argument of a complex number\n", __func__);
    {
      auto	Z = mmux_flonumcf64_rectangular_literal(1.2,3.4);
      auto	A = mmux_ctype_argument(Z);

      mmux_ctype_dprintf(2, A);
      dprintf_newline(2);
    }

    dprintf(2, "%s: compute the complex argument of a real number\n", __func__);
    {
      mmux_flonumf64_t   Z = mmux_flonumf64_literal(0.123);
      mmux_flonumf64_t   A = mmux_flonumf64_argument(Z);

      mmux_flonumf64_dprintf(2, A);
      dprintf_newline(2);
    }

    dprintf(2, "%s: generically compute the complex argument of a real number\n", __func__);
    {
      auto	Z = mmux_flonumf64_literal(0.123);
      auto	A = mmux_ctype_argument(Z);

      mmux_ctype_dprintf(2, A);
      dprintf_newline(2);
    }
  }

/* ------------------------------------------------------------------ */

  {
    dprintf(2, "%s: compute the complex conjugate of a complex number\n", __func__);
    {
      mmux_flonumcf64_t  Z = mmux_flonumcf64_rectangular_literal(1.2,3.4);
      mmux_flonumcf64_t  A = mmux_flonumcf64_conjugate(Z);

      mmux_flonumcf64_dprintf(2, A);
      dprintf_newline(2);
    }

    dprintf(2, "%s: generically compute the complex conjugate of a complex number\n", __func__);
    {
      auto	Z = mmux_flonumcf64_rectangular_literal(1.2,3.4);
      auto	A = mmux_ctype_conjugate(Z);

      mmux_ctype_dprintf(2, A);
      dprintf_newline(2);
    }

    dprintf(2, "%s: compute the complex conjugate of a real number\n", __func__);
    {
      mmux_flonumf64_t   Z = mmux_flonumf64_literal(0.123);
      mmux_flonumf64_t   A = mmux_flonumf64_conjugate(Z);

      mmux_flonumf64_dprintf(2, A);
      dprintf_newline(2);
    }

    dprintf(2, "%s: generically compute the complex conjugate of a real number\n", __func__);
    {
      auto	Z = mmux_flonumf64_literal(0.123);
      auto	A = mmux_ctype_conjugate(Z);

      mmux_ctype_dprintf(2, A);
      dprintf_newline(2);
    }
  }

  dprintf(2, "%s: leave\n", __func__);
}


static void
test_stringrep_sprinters (void)
{
  dprintf(2, "%s: enter\n", __func__);

  {
    dprintf(2, "%s: sprinting a flonumdb\n", __func__);
    {
      mmux_flonumdb_t  value           = mmux_flonumdb_literal(0.123);
      mmux_sint_t      required_nbytes = mmux_flonumdb_sprint_size(value);

      if (mmux_sint_is_negative(required_nbytes)) {
	exit(EXIT_FAILURE);
      } else {
	char    str[required_nbytes.value];

	if (mmux_flonumdb_sprint(str, required_nbytes, value)) {
	  exit(EXIT_FAILURE);
	}
	dprintf(2, "%s", str); dprintf_newline(2);
      }
    }

    dprintf(2, "%s: generically sprinting a flonumdb\n", __func__);
    {
      auto    value           = mmux_flonumdb_literal(0.123);
      auto    required_nbytes = mmux_ctype_sprint_size(value);

      if (mmux_ctype_is_negative(required_nbytes)) {
	exit(EXIT_FAILURE);
      } else {
	char    str[required_nbytes.value];

	if (mmux_ctype_sprint(str, required_nbytes, value)) {
	  exit(EXIT_FAILURE);
	}
	dprintf(2, "%s", str); dprintf_newline(2);
      }
    }
  }

  dprintf(2, "%s: leave\n", __func__);
}


static void
test_predicates (void)
{
  dprintf(2, "%s: enter\n", __func__);

  {
    dprintf(2, "%s: test if a number is zero\n", __func__);
    {
      mmux_flonumf32x_t	val = mmux_flonumf32x_literal(123.45);

      if (mmux_flonumf32x_is_zero(val)) {
	dprintf(2, "%s: it is zero\n", __func__);
      } else {
	dprintf(2, "%s: it is not zero\n", __func__);
      }
    }
    dprintf(2, "%s: generically test if a number is zero\n", __func__);
    {
      auto	val = mmux_flonumf32x_literal(123.45);

      if (mmux_ctype_is_zero(val)) {
	dprintf(2, "%s: it is zero\n", __func__);
      } else {
	dprintf(2, "%s: it is not zero\n", __func__);
      }
    }
  }

  dprintf(2, "%s: leave\n", __func__);
}


static void
test_comparison (void)
{
  dprintf(2, "%s: enter\n", __func__);

  {
    dprintf(2, "%s: compare two numbers\n", __func__);
    {
      mmux_slong_t	A = mmux_slong_literal(123);
      mmux_slong_t	B = mmux_slong_literal(456);
      mmux_sint_t	V = mmux_slong_cmp(A, B);

      dprintf(2, "%s: V=%d\n", __func__, V.value);
    }
    dprintf(2, "%s: generically compare two numbers\n", __func__);
    {
      auto		A = mmux_slong_literal(123);
      auto		B = mmux_slong_literal(456);
      mmux_sint_t	V = mmux_ctype_cmp(A, B);

      dprintf(2, "%s: V=%d\n", __func__, V.value);
    }
  }

/* ------------------------------------------------------------------ */

  {
    dprintf(2, "%s: determine the maximum between two numbers\n", __func__);
    {
      mmux_uint64_t	A = mmux_uint64_literal(123);
      mmux_uint64_t	B = mmux_uint64_literal(456);
      mmux_uint64_t	V = mmux_uint64_max(A, B);

      mmux_uint64_dprintf(2, V); dprintf_newline(2);
    }
    dprintf(2, "%s: generically determine the maximum between two numbers\n", __func__);
    {
      auto	A = mmux_uint64_literal(123);
      auto	B = mmux_uint64_literal(456);
      auto	V = mmux_ctype_max(A, B);

      mmux_ctype_dprintf(2, V); dprintf_newline(2);
    }
  }

/* ------------------------------------------------------------------ */

  {
    dprintf(2, "%s: compare flonums with absmargin criterion\n", __func__);
    {
      mmux_flonumldb_t	op1 = mmux_flonumldb_literal(1.2);
      mmux_flonumldb_t	op2 = mmux_flonumldb_literal(1.23);
      mmux_flonumldb_t	mrg = mmux_flonumldb_literal(1e-6);

      if (mmux_flonumldb_equal_absmargin(op1, op2, mrg)) {
	dprintf(2, "%s: absmargin equal\n", __func__);
      } else {
	dprintf(2, "%s: absmargin not equal\n", __func__);
      }
    }
    dprintf(2, "%s: generically compare flonums with absmargin criterion\n", __func__);
    {
      auto	op1 = mmux_flonumldb_literal(1.2);
      auto	op2 = mmux_flonumldb_literal(1.23);
      auto	mrg = mmux_flonumldb_literal(1e-6);

      if (mmux_ctype_equal_absmargin(op1, op2, mrg)) {
	dprintf(2, "%s: absmargin equal\n", __func__);
      } else {
	dprintf(2, "%s: absmargin not equal\n", __func__);
      }
    }
  }

/* ------------------------------------------------------------------ */

  {
    dprintf(2, "%s: compare flonums with relepsilon criterion\n", __func__);
    {
      mmux_flonumldb_t	op1 = mmux_flonumldb_literal(1.2);
      mmux_flonumldb_t	op2 = mmux_flonumldb_literal(1.23);
      mmux_flonumldb_t	eps = mmux_flonumldb_literal(1e-6);

      if (mmux_flonumldb_equal_relepsilon(op1, op2, eps)) {
	dprintf(2, "%s: relepsilon equal\n", __func__);
      } else {
	dprintf(2, "%s: relepsilon not equal\n", __func__);
      }
    }
    dprintf(2, "%s: generically compare flonums with relepsilon criterion\n", __func__);
    {
      auto	op1 = mmux_flonumldb_literal(1.2);
      auto	op2 = mmux_flonumldb_literal(1.23);
      auto	eps = mmux_flonumldb_literal(1e-6);

      if (mmux_ctype_equal_relepsilon(op1, op2, eps)) {
	dprintf(2, "%s: relepsilon equal\n", __func__);
      } else {
	dprintf(2, "%s: relepsilon not equal\n", __func__);
      }
    }
  }

  dprintf(2, "%s: leave\n", __func__);
}


static void
test_arithmetics (void)
{
  dprintf(2, "%s: enter\n", __func__);

  {
    dprintf(2, "%s: add two numbers\n", __func__);
    {
      mmux_flonumf128_t	A = mmux_flonumf128_literal(1.23);
      mmux_flonumf128_t	B = mmux_flonumf128_literal(4.56);
      mmux_flonumf128_t	C = mmux_flonumf128_add(A, B);

      mmux_flonumf128_dprintf(2, C); dprintf_newline(2);
    }
    dprintf(2, "%s: generically add two numbers\n", __func__);
    {
      auto	A = mmux_flonumf128_literal(1.23);
      auto	B = mmux_flonumf128_literal(4.56);
      auto	C = mmux_ctype_add(A, B);

      mmux_ctype_dprintf(2, C); dprintf_newline(2);
    }
  }

/* ------------------------------------------------------------------ */

  {
    dprintf(2, "%s: negate an unsigned integer\n", __func__);
    {
      auto    op  = mmux_ulong_literal(5);
      auto    rop = mmux_ctype_neg(op);

      mmux_ctype_dprintf(2, rop); dprintf_newline(2);
    }
  }

  dprintf(2, "%s: leave\n", __func__);
}


static void
test_mathematics (void)
{
  dprintf(2, "%s: enter\n", __func__);

  {
    dprintf(2, "%s: compute the trigonometric cosine of a number\n", __func__);
    {
      mmux_flonumdb_t	X = mmux_flonumdb_literal(0.123);
      mmux_flonumdb_t	Y = mmux_flonumdb_cos(X);

      mmux_flonumdb_dprintf(2, Y); dprintf_newline(2);
    }
    dprintf(2, "%s: generically compute the trigonometric cosine of a number\n", __func__);
    {
      auto	X = mmux_flonumdb_literal(0.123);
      auto	Y = mmux_ctype_cos(X);

      mmux_ctype_dprintf(2, Y); dprintf_newline(2);
    }
  }

  dprintf(2, "%s: leave\n", __func__);
}


static void
test_bitwise (void)
{
  dprintf(2, "%s: enter\n", __func__);

  {
    dprintf(2, "%s: XOR two numbers\n", __func__);
    {
      mmux_uint_t	A    = mmux_uint_literal(0b111000);
      mmux_uint_t	B    = mmux_uint_literal(0b101010);
      mmux_uint_t	C    = mmux_uint_bitwise_xor(A, B);
      mmux_uint_t	base = mmux_uint_literal(2);

      mmux_uint_dprintf_with_base(2, C, base); dprintf_newline(2);
    }
    dprintf(2, "%s: generically XOR two numbers\n", __func__);
    {
      auto	A = mmux_uint_literal(0b111000);
      auto	B = mmux_uint_literal(0b101010);
      auto	C = mmux_ctype_bitwise_xor(A, B);
      auto	base = mmux_uint_literal(2);

      mmux_ctype_dprintf_with_base(2, C, base); dprintf_newline(2);
    }
  }

  dprintf(2, "%s: leave\n", __func__);
}


/** --------------------------------------------------------------------
 ** Let's go.
 ** ----------------------------------------------------------------- */

int
main (int argc MMUX_CC_TYPES_UNUSED, char const *const argv[] MMUX_CC_TYPES_UNUSED)
{
  mmux_cc_types_init();
  test_set_output_formats();

  if (1) {	test_real_numbers();		}
  if (1) {	test_complex_numbers();		}
  if (1) {	test_stringrep_sprinters();	}
  if (1) {	test_predicates();		}
  if (1) {	test_comparison();		}
  if (1) {	test_arithmetics();		}
  if (1) {	test_mathematics();		}
  if (1) {	test_bitwise();			}

  exit(EXIT_SUCCESS);
}

/* end of file */
