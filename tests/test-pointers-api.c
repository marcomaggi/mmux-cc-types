/*
  Part of: MMUX CC Tests
  Contents: test for functions
  Date: Sep 28, 2025

  Abstract

	Test file for functions.

  Copyright (C) 2025, 2026 Marco Maggi <mrc.mgg@gmail.com>

  See the COPYING file.
*/


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <test-common.h>


/** --------------------------------------------------------------------
 ** Macros.
 ** ----------------------------------------------------------------- */

#define dprintf_bool(FD,BOOL)	dprintf((FD), "%s", BOOL_STRING(BOOL));

#undef  PERFORM_THE_CALL
#define PERFORM_THE_CALL(THE_CALL)								\
  if (THE_CALL) {										\
    dprintf(2, "\n*** %s: expected no error from function call '%s'\n", __func__, #THE_CALL);	\
    exit(EXIT_FAILURE);										\
  }

#undef  VALIDATE_RESULT_EXACTLY
#define VALIDATE_RESULT_EXACTLY(STEM,FUNC,EXPECTED_RESULT,GOT_RESULT)		\
  if (mmux_##STEM##_not_equal(EXPECTED_RESULT, GOT_RESULT)) {			\
    dprintf(2, "\n*** %s: expected %s[%s]='", __func__, #FUNC, #STEM);		\
    mmux_ctype_dprintf_no_error(2, EXPECTED_RESULT);					\
    dprintf(2, "' got '");							\
    mmux_ctype_dprintf_no_error(2, GOT_RESULT);						\
    dprintf(2, "'\n");								\
    exit(EXIT_FAILURE);								\
  }

#undef  VALIDATE_BOOL_RESULT
#define VALIDATE_BOOL_RESULT(STEM,FUNC,EXPECTED_RESULT,GOT_RESULT)		\
  if (EXPECTED_RESULT != GOT_RESULT) {						\
    dprintf(2, "\n*** %s: expected %s[%s]='", __func__, #FUNC, #STEM);		\
    dprintf_bool(2, EXPECTED_RESULT);						\
    dprintf(2, "' got '");							\
    dprintf_bool(2, GOT_RESULT);						\
    dprintf(2, "'\n");								\
    exit(EXIT_FAILURE);								\
  }


static void
test_arithmetic_operations (void)
{
  dprintf(2, "running test: %s:", __func__);

/* ------------------------------------------------------------------ */

  {
    auto		op1  = mmux_pointer_literal(123);
    auto		op2  = mmux_ptrdiff_literal(456);
    typeof(op1)		rop1;
    auto		erop = mmux_pointer_literal(579);
    PERFORM_THE_CALL(mmux_pointer_add_p(&rop1, &op1, &op2));
    VALIDATE_RESULT_EXACTLY(pointer,add,erop,rop1);
    dprintf(2, " %s,", "pointer");
  }

/* ------------------------------------------------------------------ */

  {
    auto		op1  = mmux_char_literal(12);
    auto		op2  = mmux_char_literal(34);
    typeof(op1)		rop1;
    auto		erop = mmux_char_literal(46);
    PERFORM_THE_CALL(mmux_char_add_p(&rop1, &op1, &op2));
    VALIDATE_RESULT_EXACTLY(char,add,erop,rop1);
    dprintf(2, " %s,", "char");
  }

/* ------------------------------------------------------------------ */

  {
    auto		op1  = mmux_schar_literal(12);
    auto		op2  = mmux_schar_literal(34);
    typeof(op1)		rop1;
    auto		erop = mmux_schar_literal(46);
    PERFORM_THE_CALL(mmux_schar_add_p(&rop1, &op1, &op2));
    VALIDATE_RESULT_EXACTLY(schar,add,erop,rop1);
    dprintf(2, " %s,", "schar");
  }

/* ------------------------------------------------------------------ */

  {
    auto		op1  = mmux_flonumcdb_rectangular_literal(0.12,0.23);
    auto		op2  = mmux_flonumcdb_rectangular_literal(0.45,0.67);
    typeof(op1)		rop1;
    auto		erop = mmux_flonumcdb_rectangular_literal(0.57,0.90);
    PERFORM_THE_CALL(mmux_flonumcdb_add_p(&rop1, &op1, &op2));
    VALIDATE_RESULT_EXACTLY(flonumcdb,add,erop,rop1);
    dprintf(2, " %s,", "flonumcdb");
  }

/* ------------------------------------------------------------------ */

  dprintf(2, " DONE.\n\n");
}


static void
test_predicates (void)
{
  dprintf(2, "running test: %s:", __func__);

/* ------------------------------------------------------------------ */

  {
    auto	op1  = mmux_pointer_literal(123);
    bool	rop1;
    auto	erop = false;
    PERFORM_THE_CALL(mmux_pointer_is_zero_p(&rop1, &op1));
    VALIDATE_BOOL_RESULT(pointer,is_zero,erop,rop1);
    dprintf(2, " %s,", "pointer");
  }

/* ------------------------------------------------------------------ */

  {
    auto	op1  = mmux_sint_literal(123);
    bool	rop1;
    auto	erop = false;
    PERFORM_THE_CALL(mmux_sint_is_zero_p(&rop1, &op1));
    VALIDATE_BOOL_RESULT(sint,is_zero,erop,rop1);
    dprintf(2, " %s,", "sint");
  }

/* ------------------------------------------------------------------ */

  {
    auto	op1  = mmux_flonumcdb_rectangular_literal(0.12,0.23);
    bool	rop1;
    auto	erop = false;
    PERFORM_THE_CALL(mmux_flonumcdb_is_zero_p(&rop1, &op1));
    VALIDATE_BOOL_RESULT(flonumcdb,is_zero,erop,rop1);
    dprintf(2, " %s,", "flonumcdb");
  }

/* ------------------------------------------------------------------ */

  dprintf(2, " DONE.\n\n");
}


static void
test_bitwise_operations (void)
{
  dprintf(2, "running test: %s:", __func__);

/* ------------------------------------------------------------------ */

  /* Emacs Lisp: (logand 123 456) => 72 */
  {
    auto		op1  = mmux_pointer_literal(123);
    auto		op2  = mmux_uintptr_literal(456);
    typeof(op1)		rop1;
    auto		erop = mmux_pointer_literal(72);
    PERFORM_THE_CALL(mmux_pointer_bitwise_and_p(&rop1, &op1, &op2));
    VALIDATE_RESULT_EXACTLY(pointer,add,erop,rop1);
    dprintf(2, " %s,", "pointer");
  }

/* ------------------------------------------------------------------ */

  /* Emacs Lisp: (logand 12 34) => 0 */
  {
    auto		op1  = mmux_schar_literal(12);
    auto		op2  = mmux_schar_literal(34);
    typeof(op1)		rop1;
    auto		erop = mmux_schar_constant_zero();
    PERFORM_THE_CALL(mmux_schar_bitwise_and_p(&rop1, &op1, &op2));
    VALIDATE_RESULT_EXACTLY(schar,add,erop,rop1);
    dprintf(2, " %s,", "schar");
  }

/* ------------------------------------------------------------------ */

  dprintf(2, " DONE.\n\n");
}


/** --------------------------------------------------------------------
 ** Let's go.
 ** ----------------------------------------------------------------- */

int
main (int argc MMUX_CC_TYPES_UNUSED, char const *const argv[] MMUX_CC_TYPES_UNUSED)
{
  mmux_cc_types_init();
  test_set_output_formats();

  if (1) {	test_arithmetic_operations();	}
  if (1) {	test_predicates();		}
  if (1) {	test_bitwise_operations();	}

  exit(EXIT_SUCCESS);
}

/* end of file */
