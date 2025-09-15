/*
  Part of: MMUX CC Tests
  Contents: test functions
  Date: Sep 14, 2025

  Abstract

	Test comparison functions.

  Copyright (C) 2024, 2025 Marco Maggi <mrc.mgg@gmail.com>

  See the COPYING file.
*/


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <test-common.h>


/** --------------------------------------------------------------------
 ** Macros: exact comparison.
 ** ----------------------------------------------------------------- */

#undef  DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE
#define DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(STEM,PRED,LITERAL1,LITERAL2)	\
  {										\
    auto	op1 = mmux_##STEM##_literal(LITERAL1);				\
    auto	op2 = mmux_##STEM##_literal(LITERAL2);				\
    if (! mmux_##STEM##_##PRED(op1, op2)) {					\
      dprintf(2, "\nexpected '%s_%s(", #STEM, #PRED);				\
      mmux_ctype_dprintf(2, op1);						\
      dprintf(2, ", ");								\
      mmux_ctype_dprintf(2, op2);						\
      dprintf(2, ")' = true\n");						\
      exit(EXIT_FAILURE);							\
    }										\
    if (! mmux_ctype_##PRED(op1, op2)) {					\
      dprintf(2, "\nexpected 'ctype(%s)_%s(", #STEM, #PRED);			\
      mmux_ctype_dprintf(2, op1);						\
      dprintf(2, ", ");								\
      mmux_ctype_dprintf(2, op2);						\
      dprintf(2, ")' = true\n");						\
      exit(EXIT_FAILURE);							\
    }										\
  }

#undef  DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE
#define DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE(STEM,PRED,LITERAL1,LITERAL2)	\
  {										\
    auto	op1 = mmux_##STEM##_literal(LITERAL1);				\
    auto	op2 = mmux_##STEM##_literal(LITERAL2);				\
    if (mmux_##STEM##_##PRED(op1, op2)) {					\
      dprintf(2, "\nexpected '%s_%s(", #STEM, #PRED);				\
      mmux_ctype_dprintf(2, op1);						\
      dprintf(2, ", ");								\
      mmux_ctype_dprintf(2, op2);						\
      dprintf(2, ")' = false\n");						\
      exit(EXIT_FAILURE);							\
    }										\
    if (mmux_ctype_##PRED(op1, op2)) {						\
      dprintf(2, "\nexpected 'ctype(%s)_%s(", #STEM, #PRED);			\
      mmux_ctype_dprintf(2, op1);						\
      dprintf(2, ", ");								\
      mmux_ctype_dprintf(2, op2);						\
      dprintf(2, ")' = false\n");						\
      exit(EXIT_FAILURE);							\
    }										\
  }

/* ------------------------------------------------------------------ */

#undef  DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE
#define DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE(STEM,PRED,				\
						LITERAL1_RE,LITERAL1_IM,		\
						LITERAL2_RE,LITERAL2_IM)		\
  {											\
    auto	op1 = mmux_##STEM##_rectangular_literal(LITERAL1_RE, LITERAL1_IM);	\
    auto	op2 = mmux_##STEM##_rectangular_literal(LITERAL2_RE, LITERAL2_IM);	\
    if (! mmux_##STEM##_##PRED(op1, op2)) {						\
      dprintf(2, "\nexpected '%s_%s(", #STEM, #PRED);					\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, ", ");									\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, ")' = true\n");							\
      exit(EXIT_FAILURE);								\
    }											\
    if (! mmux_ctype_##PRED(op1, op2)) {						\
      dprintf(2, "\nexpected 'ctype(%s)_%s(", #STEM, #PRED);				\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, ", ");									\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, ")' = true\n");							\
      exit(EXIT_FAILURE);								\
    }											\
  }

#undef  DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE
#define DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE(STEM,PRED,				\
						 LITERAL1_RE,LITERAL1_IM,		\
						 LITERAL2_RE,LITERAL2_IM)		\
  {											\
    auto	op1 = mmux_##STEM##_rectangular_literal(LITERAL1_RE, LITERAL1_IM);	\
    auto	op2 = mmux_##STEM##_rectangular_literal(LITERAL2_RE, LITERAL2_IM);	\
    if (mmux_##STEM##_##PRED(op1, op2)) {						\
      dprintf(2, "\nexpected '%s_%s(", #STEM, #PRED);					\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, ", ");									\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, ")' = false\n");							\
      exit(EXIT_FAILURE);								\
    }											\
    if (mmux_ctype_##PRED(op1, op2)) {							\
      dprintf(2, "\nexpected 'ctype(%s)_%s(", #STEM, #PRED);				\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, ", ");									\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, ")' = false\n");							\
      exit(EXIT_FAILURE);								\
    }											\
  }


/** --------------------------------------------------------------------
 ** Macros: absolute margin comparison.
 ** ----------------------------------------------------------------- */

#undef  DO_ABSMARGIN_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE
#define DO_ABSMARGIN_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(STEM,LITERAL1,LITERAL2)		\
  {											\
    auto	op1 = mmux_##STEM##_literal(LITERAL1);					\
    auto	op2 = mmux_##STEM##_literal(LITERAL2);					\
    auto	mrg = mmux_##STEM##_literal(1e-3);					\
    if (! mmux_##STEM##_equal_absmargin(op1, op2, mrg)) {				\
      dprintf(2, "\nexpected '%s_equal_absmargin(", #STEM);				\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, ", ");									\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, ")' = true\n");							\
      exit(EXIT_FAILURE);								\
    }											\
    if (! mmux_ctype_equal_absmargin(op1, op2, mrg)) {					\
      dprintf(2, "\nexpected 'ctype(%s)_equal_absmargin(", #STEM);			\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, ", ");									\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, ")' = true\n");							\
      exit(EXIT_FAILURE);								\
    }											\
  }

#undef  DO_ABSMARGIN_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE
#define DO_ABSMARGIN_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE(STEM,LITERAL1,LITERAL2)	\
  {											\
    auto	op1 = mmux_##STEM##_literal(LITERAL1);					\
    auto	op2 = mmux_##STEM##_literal(LITERAL2);					\
    auto	mrg = mmux_##STEM##_literal(1e-3);					\
    if (mmux_##STEM##_equal_absmargin(op1, op2, mrg)) {					\
      dprintf(2, "\nexpected '%s_equal_absmargin(", #STEM);				\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, ", ");									\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, ")' = false\n");							\
      exit(EXIT_FAILURE);								\
    }											\
    if (mmux_ctype_equal_absmargin(op1, op2, mrg)) {					\
      dprintf(2, "\nexpected 'ctype(%s)_equal_absmargin(", #STEM);			\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, ", ");									\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, ")' = false\n");							\
      exit(EXIT_FAILURE);								\
    }											\
  }

/* ------------------------------------------------------------------ */

#undef  DO_ABSMARGIN_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE
#define DO_ABSMARGIN_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE(STEM,				\
							LITERAL1_RE,LITERAL1_IM,	\
							LITERAL2_RE,LITERAL2_IM)	\
  {											\
    auto	op1 = mmux_##STEM##_rectangular_literal(LITERAL1_RE, LITERAL1_IM);	\
    auto	op2 = mmux_##STEM##_rectangular_literal(LITERAL2_RE, LITERAL2_IM);	\
    auto	mrg = mmux_##STEM##_rectangular_literal(1e-3, 1e-3);			\
    if (! mmux_##STEM##_equal_absmargin(op1, op2, mrg)) {				\
      dprintf(2, "\nexpected '%s_equal_absmargin(", #STEM);				\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, ", ");									\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, ")' = true\n");							\
      exit(EXIT_FAILURE);								\
    }											\
    if (! mmux_ctype_equal_absmargin(op1, op2, mrg)) {					\
      dprintf(2, "\nexpected 'ctype(%s)_equal_absmargin(", #STEM);			\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, ", ");									\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, ")' = true\n");							\
      exit(EXIT_FAILURE);								\
    }											\
  }

#undef  DO_ABSMARGIN_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE
#define DO_ABSMARGIN_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE(STEM,				\
							 LITERAL1_RE,LITERAL1_IM,	\
							 LITERAL2_RE,LITERAL2_IM)	\
  {											\
    auto	op1 = mmux_##STEM##_rectangular_literal(LITERAL1_RE, LITERAL1_IM);	\
    auto	op2 = mmux_##STEM##_rectangular_literal(LITERAL2_RE, LITERAL2_IM);	\
    auto	mrg = mmux_##STEM##_rectangular_literal(1e-3, 1e-3);			\
    if (mmux_##STEM##_equal_absmargin(op1, op2, mrg)) {					\
      dprintf(2, "\nexpected '%s_equal_absmargin(", #STEM);				\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, ", ");									\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, ")' = false\n");							\
      exit(EXIT_FAILURE);								\
    }											\
    if (mmux_ctype_equal_absmargin(op1, op2, mrg)) {					\
      dprintf(2, "\nexpected 'ctype(%s)_equal_absmargin(", #STEM);			\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, ", ");									\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, ")' = false\n");							\
      exit(EXIT_FAILURE);								\
    }											\
  }


/** --------------------------------------------------------------------
 ** Macros: relative epsilon comparison.
 ** ----------------------------------------------------------------- */

#undef  DO_RELEPSILON_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE
#define DO_RELEPSILON_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(STEM,LITERAL1,LITERAL2)	\
  {										\
    auto	op1 = mmux_##STEM##_literal(LITERAL1);				\
    auto	op2 = mmux_##STEM##_literal(LITERAL2);				\
    auto	eps = mmux_##STEM##_literal(1e-3);				\
    if (! mmux_##STEM##_equal_relepsilon(op1, op2, eps)) {			\
      dprintf(2, "\nexpected '%s_equal_relepsilon(", #STEM);			\
      mmux_ctype_dprintf(2, op1);						\
      dprintf(2, ", ");								\
      mmux_ctype_dprintf(2, op2);						\
      dprintf(2, ")' = true\n");						\
      exit(EXIT_FAILURE);							\
    }										\
    if (! mmux_ctype_equal_relepsilon(op1, op2, eps)) {				\
      dprintf(2, "\nexpected 'ctype(%s)_equal_relepsilon(", #STEM);		\
      mmux_ctype_dprintf(2, op1);						\
      dprintf(2, ", ");								\
      mmux_ctype_dprintf(2, op2);						\
      dprintf(2, ")' = true\n");						\
      exit(EXIT_FAILURE);							\
    }										\
  }

#undef  DO_RELEPSILON_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE
#define DO_RELEPSILON_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE(STEM,LITERAL1,LITERAL2)	\
  {										\
    auto	op1 = mmux_##STEM##_literal(LITERAL1);				\
    auto	op2 = mmux_##STEM##_literal(LITERAL2);				\
    auto	eps = mmux_##STEM##_literal(1e-3);				\
    if (mmux_##STEM##_equal_relepsilon(op1, op2, eps)) {			\
      dprintf(2, "\nexpected '%s_equal_relepsilon(", #STEM);			\
      mmux_ctype_dprintf(2, op1);						\
      dprintf(2, ", ");								\
      mmux_ctype_dprintf(2, op2);						\
      dprintf(2, ")' = false\n");						\
      exit(EXIT_FAILURE);							\
    }										\
    if (mmux_ctype_equal_relepsilon(op1, op2, eps)) {				\
      dprintf(2, "\nexpected 'ctype(%s)_equal_relepsilon(", #STEM);		\
      mmux_ctype_dprintf(2, op1);						\
      dprintf(2, ", ");								\
      mmux_ctype_dprintf(2, op2);						\
      dprintf(2, ")' = false\n");						\
      exit(EXIT_FAILURE);							\
    }										\
  }

/* ------------------------------------------------------------------ */

#undef  DO_RELEPSILON_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE
#define DO_RELEPSILON_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE(STEM,				\
						      LITERAL1_RE,LITERAL1_IM,		\
						      LITERAL2_RE,LITERAL2_IM)		\
  {											\
    auto	op1 = mmux_##STEM##_rectangular_literal(LITERAL1_RE, LITERAL1_IM);	\
    auto	op2 = mmux_##STEM##_rectangular_literal(LITERAL2_RE, LITERAL2_IM);	\
    auto	eps = mmux_##STEM##_rectangular_literal(1e-3, 1e-3);			\
    if (! mmux_##STEM##_equal_relepsilon(op1, op2, eps)) {				\
      dprintf(2, "\nexpected '%s_equal_relepsilon(", #STEM);				\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, ", ");									\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, ")' = true\n");							\
      exit(EXIT_FAILURE);								\
    }											\
    if (! mmux_ctype_equal_relepsilon(op1, op2, eps)) {					\
      dprintf(2, "\nexpected 'ctype(%s)_equal_relepsilon(", #STEM);			\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, ", ");									\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, ")' = true\n");							\
      exit(EXIT_FAILURE);								\
    }											\
  }

#undef  DO_RELEPSILON_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE
#define DO_RELEPSILON_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE(STEM,				\
						       LITERAL1_RE,LITERAL1_IM,		\
						       LITERAL2_RE,LITERAL2_IM)		\
  {											\
    auto	op1 = mmux_##STEM##_rectangular_literal(LITERAL1_RE, LITERAL1_IM);	\
    auto	op2 = mmux_##STEM##_rectangular_literal(LITERAL2_RE, LITERAL2_IM);	\
    auto	eps = mmux_##STEM##_rectangular_literal(1e-3, 1e-3);			\
    if (mmux_##STEM##_equal_relepsilon(op1, op2, eps)) {				\
      dprintf(2, "\nexpected '%s_equal_relepsilon(", #STEM);				\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, ", ");									\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, ")' = false\n");							\
      exit(EXIT_FAILURE);								\
    }											\
    if (mmux_ctype_equal_relepsilon(op1, op2, eps)) {					\
      dprintf(2, "\nexpected 'ctype(%s)_equal_relepsilon(", #STEM);			\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, ", ");									\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, ")' = false\n");							\
      exit(EXIT_FAILURE);								\
    }											\
  }


/** --------------------------------------------------------------------
 ** Macros: min, max.
 ** ----------------------------------------------------------------- */

#undef  DO_MINMAX_FOR_THESE_REAL_NUMBERS_EXPECT_1ST
#define DO_MINMAX_FOR_THESE_REAL_NUMBERS_EXPECT_1ST(STEM,MINMAX,LITERAL1,LITERAL2)	\
  {											\
    auto	op1  = mmux_##STEM##_literal(LITERAL1);					\
    auto	op2  = mmux_##STEM##_literal(LITERAL2);					\
    auto	rop1 = mmux_##STEM##_##MINMAX(op1, op2);				\
    auto	rop2 = mmux_ctype_##MINMAX(op1, op2);					\
    if (! mmux_ctype_equal(op1, rop1)) {						\
      dprintf(2, "\nexpected 1st '%s_%s(", #STEM, #MINMAX);				\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, ", ");									\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, ")' = '");								\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, "' got '");								\
      mmux_ctype_dprintf(2, rop1);							\
      dprintf(2, "'\n");								\
      exit(EXIT_FAILURE);								\
    }											\
    if (! mmux_ctype_equal(op1, rop2)) {						\
      dprintf(2, "\nexpected 1st 'ctype(%s)_%s(", #STEM, #MINMAX);			\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, ", ");									\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, ")' = '");								\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, "' got '");								\
      mmux_ctype_dprintf(2, rop2);							\
      dprintf(2, "'\n");								\
      exit(EXIT_FAILURE);								\
    }											\
  }

#undef  DO_MINMAX_FOR_THESE_REAL_NUMBERS_EXPECT_2ND
#define DO_MINMAX_FOR_THESE_REAL_NUMBERS_EXPECT_2ND(STEM,MINMAX,LITERAL1,LITERAL2)	\
  {											\
    auto	op1  = mmux_##STEM##_literal(LITERAL1);					\
    auto	op2  = mmux_##STEM##_literal(LITERAL2);					\
    auto	rop1 = mmux_##STEM##_##MINMAX(op1, op2);				\
    auto	rop2 = mmux_ctype_##MINMAX(op1, op2);					\
    if (! mmux_ctype_equal(op2, rop1)) {						\
      dprintf(2, "\nexpected 2nd '%s_%s(", #STEM, #MINMAX);				\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, ", ");									\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, ")' = '");								\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, "' got '");								\
      mmux_ctype_dprintf(2, rop1);							\
      dprintf(2, "'\n");								\
      exit(EXIT_FAILURE);								\
    }											\
    if (! mmux_ctype_equal(op2, rop2)) {						\
      dprintf(2, "\nexpected 2nd 'ctype(%s)_%s(", #STEM, #MINMAX);			\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, ", ");									\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, ")' = '");								\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, "' got '");								\
      mmux_ctype_dprintf(2, rop2);							\
      dprintf(2, "'\n");								\
      exit(EXIT_FAILURE);								\
    }											\
  }

/* ------------------------------------------------------------------ */

#undef  DO_MINMAX_FOR_THESE_CPLX_NUMBERS_EXPECT_1ST
#define DO_MINMAX_FOR_THESE_CPLX_NUMBERS_EXPECT_1ST(STEM,MINMAX,			\
						    LITERAL1_RE,LITERAL1_IM,		\
						    LITERAL2_RE,LITERAL2_IM)		\
  {											\
    auto	op1  = mmux_##STEM##_rectangular_literal(LITERAL1_RE, LITERAL1_IM);	\
    auto	op2  = mmux_##STEM##_rectangular_literal(LITERAL2_RE, LITERAL2_IM);	\
    auto	rop1 = mmux_##STEM##_##MINMAX(op1, op2);				\
    auto	rop2 = mmux_ctype_##MINMAX(op1, op2);					\
    if (0) {										\
      dprintf(2, "\nop1 = '");								\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, "'\n");								\
      dprintf(2, "op2 = '");								\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, "'\n");								\
      dprintf(2, "rop1 = '");								\
      mmux_ctype_dprintf(2, rop1);							\
      dprintf(2, "'\n");								\
      dprintf(2, "rop2 = '");								\
      mmux_ctype_dprintf(2, rop2);							\
      dprintf(2, "'\n");								\
    }											\
    if (! mmux_ctype_equal(op1, rop1)) {						\
      dprintf(2, "\nexpected 1st '%s_%s(", #STEM, #MINMAX);				\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, ", ");									\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, ")' = '");								\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, "' got '");								\
      mmux_ctype_dprintf(2, rop1);							\
      dprintf(2, "'\n");								\
      exit(EXIT_FAILURE);								\
    }											\
    if (! mmux_ctype_equal(op1, rop2)) {						\
      dprintf(2, "\nexpected 1st 'ctype(%s)_%s(", #STEM, #MINMAX);			\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, ", ");									\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, ")' = '");								\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, "' got '");								\
      mmux_ctype_dprintf(2, rop2);							\
      dprintf(2, "'\n");								\
      exit(EXIT_FAILURE);								\
    }											\
  }

#undef  DO_MINMAX_FOR_THESE_CPLX_NUMBERS_EXPECT_2ND
#define DO_MINMAX_FOR_THESE_CPLX_NUMBERS_EXPECT_2ND(STEM,MINMAX,			\
						    LITERAL1_RE,LITERAL1_IM,		\
						    LITERAL2_RE,LITERAL2_IM)		\
  {											\
    auto	op1  = mmux_##STEM##_rectangular_literal(LITERAL1_RE, LITERAL1_IM);	\
    auto	op2  = mmux_##STEM##_rectangular_literal(LITERAL2_RE, LITERAL2_IM);	\
    auto	rop1 = mmux_##STEM##_##MINMAX(op1, op2);				\
    auto	rop2 = mmux_ctype_##MINMAX(op1, op2);					\
    if (0) {										\
      dprintf(2, "\nop1 = '");								\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, "'\n");								\
      dprintf(2, "op2 = '");								\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, "'\n");								\
      dprintf(2, "rop1 = '");								\
      mmux_ctype_dprintf(2, rop1);							\
      dprintf(2, "'\n");								\
      dprintf(2, "rop2 = '");								\
      mmux_ctype_dprintf(2, rop2);							\
      dprintf(2, "'\n");								\
    }											\
    if (! mmux_ctype_equal(op2, rop1)) {						\
      dprintf(2, "\nexpected 2nd '%s_%s(", #STEM, #MINMAX);				\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, ", ");									\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, ")' = '");								\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, "' got '");								\
      mmux_ctype_dprintf(2, rop1);							\
      dprintf(2, "'\n");								\
      exit(EXIT_FAILURE);								\
    }											\
    if (! mmux_ctype_equal(op2, rop2)) {						\
      dprintf(2, "\nexpected 2nd 'ctype(%s)_%s(", #STEM, #MINMAX);			\
      mmux_ctype_dprintf(2, op1);							\
      dprintf(2, ", ");									\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, ")' = '");								\
      mmux_ctype_dprintf(2, op2);							\
      dprintf(2, "' got '");								\
      mmux_ctype_dprintf(2, rop2);							\
      dprintf(2, "'\n");								\
      exit(EXIT_FAILURE);								\
    }											\
  }


static void
test_comparison_equal (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_EXACT_INTEGER
#define DOIT_FOR_EXACT_INTEGER(STEM)							\
  {											\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, equal, 12, 12);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, equal, 12, 34);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, equal, 34, 12);	};	\
    dprintf(2, " %s,", #STEM);								\
  }

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)									\
  {												\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, equal, 0.123, 0.123);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, equal, 0.123, 0.456);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, equal, 0.456, 0.123);	};	\
    dprintf(2, " %s,", #STEM);									\
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)										\
  {													\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE( STEM, equal, 0.1, 0.2, 0.1,  0.2);	};	\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE(STEM, equal, 0.1, 0.2, 0.3,  0.4);	};	\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE(STEM, equal, 0.1, 0.2, 0.03, 0.04);	};	\
    dprintf(2, " %s,", #STEM);										\
  }

/* ------------------------------------------------------------------ */

  DOIT_FOR_EXACT_INTEGER(pointer);
  DOIT_FOR_EXACT_INTEGER(char);
  DOIT_FOR_EXACT_INTEGER(schar);
  DOIT_FOR_EXACT_INTEGER(uchar);
  DOIT_FOR_EXACT_INTEGER(sshort);
  DOIT_FOR_EXACT_INTEGER(ushort);
  DOIT_FOR_EXACT_INTEGER(sint);
  DOIT_FOR_EXACT_INTEGER(uint);
  DOIT_FOR_EXACT_INTEGER(slong);
  DOIT_FOR_EXACT_INTEGER(ulong);
  DOIT_FOR_EXACT_INTEGER(sllong);
  DOIT_FOR_EXACT_INTEGER(ullong);
  DOIT_FOR_EXACT_INTEGER(sint8);
  DOIT_FOR_EXACT_INTEGER(uint8);
  DOIT_FOR_EXACT_INTEGER(sint16);
  DOIT_FOR_EXACT_INTEGER(uint16);
  DOIT_FOR_EXACT_INTEGER(sint32);
  DOIT_FOR_EXACT_INTEGER(uint32);
  DOIT_FOR_EXACT_INTEGER(sint64);
  DOIT_FOR_EXACT_INTEGER(uint64);
  DOIT_FOR_EXACT_INTEGER(byte);
  DOIT_FOR_EXACT_INTEGER(octet);
  DOIT_FOR_EXACT_INTEGER(ssize);
  DOIT_FOR_EXACT_INTEGER(usize);
  DOIT_FOR_EXACT_INTEGER(sintmax);
  DOIT_FOR_EXACT_INTEGER(uintmax);
  DOIT_FOR_EXACT_INTEGER(sintptr);
  DOIT_FOR_EXACT_INTEGER(uintptr);
  DOIT_FOR_EXACT_INTEGER(mode);
  DOIT_FOR_EXACT_INTEGER(off);
  DOIT_FOR_EXACT_INTEGER(pid);
  DOIT_FOR_EXACT_INTEGER(uid);
  DOIT_FOR_EXACT_INTEGER(gid);
  DOIT_FOR_EXACT_INTEGER(ptrdiff);
  DOIT_FOR_EXACT_INTEGER(wchar);
  DOIT_FOR_EXACT_INTEGER(wint);
  DOIT_FOR_EXACT_INTEGER(time);
  DOIT_FOR_EXACT_INTEGER(socklen);
  DOIT_FOR_EXACT_INTEGER(rlim);

/* ------------------------------------------------------------------ */

  DOIT_FOR_FLONUM(flonumfl);
  DOIT_FOR_FLONUM(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FOR_FLONUM(flonumldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FOR_FLONUM(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FOR_FLONUM(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FOR_FLONUM(flonumf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FOR_FLONUM(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FOR_FLONUM(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FOR_FLONUM(flonumf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FOR_FLONUM(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_FLONUM(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_FLONUM(flonumd128);
#endif

/* ------------------------------------------------------------------ */

  DOIT_FOR_FLONUMC(flonumcfl);
  DOIT_FOR_FLONUMC(flonumcdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(flonumcldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(flonumcf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_comparison_not_equal (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_EXACT_INTEGER
#define DOIT_FOR_EXACT_INTEGER(STEM)								\
  {												\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, not_equal, 12, 12);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, not_equal, 12, 34);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, not_equal, 34, 12);	};	\
    dprintf(2, " %s,", #STEM);									\
  }

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)									\
  {												\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, not_equal, 0.123, 0.123);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, not_equal, 0.123, 0.456);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, not_equal, 0.456, 0.123);	};	\
    dprintf(2, " %s,", #STEM);									\
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)										\
  {													\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE( STEM, not_equal, 0.1, 0.2, 0.1,  0.2);	};	\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE(  STEM, not_equal, 0.1, 0.2, 0.3,  0.4);	};	\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE(  STEM, not_equal, 0.1, 0.2, 0.03, 0.04);	};	\
    dprintf(2, " %s,", #STEM);										\
  }

  /* ------------------------------------------------------------------ */

  DOIT_FOR_EXACT_INTEGER(pointer);
  DOIT_FOR_EXACT_INTEGER(char);
  DOIT_FOR_EXACT_INTEGER(schar);
  DOIT_FOR_EXACT_INTEGER(uchar);
  DOIT_FOR_EXACT_INTEGER(sshort);
  DOIT_FOR_EXACT_INTEGER(ushort);
  DOIT_FOR_EXACT_INTEGER(sint);
  DOIT_FOR_EXACT_INTEGER(uint);
  DOIT_FOR_EXACT_INTEGER(slong);
  DOIT_FOR_EXACT_INTEGER(ulong);
  DOIT_FOR_EXACT_INTEGER(sllong);
  DOIT_FOR_EXACT_INTEGER(ullong);
  DOIT_FOR_EXACT_INTEGER(sint8);
  DOIT_FOR_EXACT_INTEGER(uint8);
  DOIT_FOR_EXACT_INTEGER(sint16);
  DOIT_FOR_EXACT_INTEGER(uint16);
  DOIT_FOR_EXACT_INTEGER(sint32);
  DOIT_FOR_EXACT_INTEGER(uint32);
  DOIT_FOR_EXACT_INTEGER(sint64);
  DOIT_FOR_EXACT_INTEGER(uint64);
  DOIT_FOR_EXACT_INTEGER(byte);
  DOIT_FOR_EXACT_INTEGER(octet);
  DOIT_FOR_EXACT_INTEGER(ssize);
  DOIT_FOR_EXACT_INTEGER(usize);
  DOIT_FOR_EXACT_INTEGER(sintmax);
  DOIT_FOR_EXACT_INTEGER(uintmax);
  DOIT_FOR_EXACT_INTEGER(sintptr);
  DOIT_FOR_EXACT_INTEGER(uintptr);
  DOIT_FOR_EXACT_INTEGER(mode);
  DOIT_FOR_EXACT_INTEGER(off);
  DOIT_FOR_EXACT_INTEGER(pid);
  DOIT_FOR_EXACT_INTEGER(uid);
  DOIT_FOR_EXACT_INTEGER(gid);
  DOIT_FOR_EXACT_INTEGER(ptrdiff);
  DOIT_FOR_EXACT_INTEGER(wchar);
  DOIT_FOR_EXACT_INTEGER(wint);
  DOIT_FOR_EXACT_INTEGER(time);
  DOIT_FOR_EXACT_INTEGER(socklen);
  DOIT_FOR_EXACT_INTEGER(rlim);

  /* ------------------------------------------------------------------ */

  DOIT_FOR_FLONUM(flonumfl);
  DOIT_FOR_FLONUM(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FOR_FLONUM(flonumldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FOR_FLONUM(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FOR_FLONUM(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FOR_FLONUM(flonumf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FOR_FLONUM(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FOR_FLONUM(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FOR_FLONUM(flonumf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FOR_FLONUM(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_FLONUM(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_FLONUM(flonumd128);
#endif

  /* ------------------------------------------------------------------ */

  DOIT_FOR_FLONUMC(flonumcfl);
  DOIT_FOR_FLONUMC(flonumcdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(flonumcldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(flonumcf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_comparison_less (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_EXACT_INTEGER
#define DOIT_FOR_EXACT_INTEGER(STEM)							\
  {											\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, less, 12, 12);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, less, 12, 34);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, less, 34, 12);	};	\
    dprintf(2, " %s,", #STEM);								\
  }

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)									\
  {												\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, less, 0.123, 0.123);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, less, 0.123, 0.456);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, less, 0.456, 0.123);	};	\
    dprintf(2, " %s,", #STEM);									\
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)										\
  {													\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE( STEM, less, 0.1, 0.2, 0.1,  0.2);	};	\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE(  STEM, less, 0.1, 0.2, 0.3,  0.4);	};	\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE( STEM, less, 0.1, 0.2, 0.03, 0.04);	};	\
    dprintf(2, " %s,", #STEM);										\
  }

/* ------------------------------------------------------------------ */

  DOIT_FOR_EXACT_INTEGER(pointer);
  DOIT_FOR_EXACT_INTEGER(char);
  DOIT_FOR_EXACT_INTEGER(schar);
  DOIT_FOR_EXACT_INTEGER(uchar);
  DOIT_FOR_EXACT_INTEGER(sshort);
  DOIT_FOR_EXACT_INTEGER(ushort);
  DOIT_FOR_EXACT_INTEGER(sint);
  DOIT_FOR_EXACT_INTEGER(uint);
  DOIT_FOR_EXACT_INTEGER(slong);
  DOIT_FOR_EXACT_INTEGER(ulong);
  DOIT_FOR_EXACT_INTEGER(sllong);
  DOIT_FOR_EXACT_INTEGER(ullong);
  DOIT_FOR_EXACT_INTEGER(sint8);
  DOIT_FOR_EXACT_INTEGER(uint8);
  DOIT_FOR_EXACT_INTEGER(sint16);
  DOIT_FOR_EXACT_INTEGER(uint16);
  DOIT_FOR_EXACT_INTEGER(sint32);
  DOIT_FOR_EXACT_INTEGER(uint32);
  DOIT_FOR_EXACT_INTEGER(sint64);
  DOIT_FOR_EXACT_INTEGER(uint64);
  DOIT_FOR_EXACT_INTEGER(byte);
  DOIT_FOR_EXACT_INTEGER(octet);
  DOIT_FOR_EXACT_INTEGER(ssize);
  DOIT_FOR_EXACT_INTEGER(usize);
  DOIT_FOR_EXACT_INTEGER(sintmax);
  DOIT_FOR_EXACT_INTEGER(uintmax);
  DOIT_FOR_EXACT_INTEGER(sintptr);
  DOIT_FOR_EXACT_INTEGER(uintptr);
  DOIT_FOR_EXACT_INTEGER(mode);
  DOIT_FOR_EXACT_INTEGER(off);
  DOIT_FOR_EXACT_INTEGER(pid);
  DOIT_FOR_EXACT_INTEGER(uid);
  DOIT_FOR_EXACT_INTEGER(gid);
  DOIT_FOR_EXACT_INTEGER(ptrdiff);
  DOIT_FOR_EXACT_INTEGER(wchar);
  DOIT_FOR_EXACT_INTEGER(wint);
  DOIT_FOR_EXACT_INTEGER(time);
  DOIT_FOR_EXACT_INTEGER(socklen);
  DOIT_FOR_EXACT_INTEGER(rlim);

/* ------------------------------------------------------------------ */

  DOIT_FOR_FLONUM(flonumfl);
  DOIT_FOR_FLONUM(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FOR_FLONUM(flonumldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FOR_FLONUM(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FOR_FLONUM(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FOR_FLONUM(flonumf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FOR_FLONUM(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FOR_FLONUM(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FOR_FLONUM(flonumf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FOR_FLONUM(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_FLONUM(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_FLONUM(flonumd128);
#endif

/* ------------------------------------------------------------------ */

  DOIT_FOR_FLONUMC(flonumcfl);
  DOIT_FOR_FLONUMC(flonumcdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(flonumcldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(flonumcf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_comparison_greater (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_EXACT_INTEGER
#define DOIT_FOR_EXACT_INTEGER(STEM)							\
  {											\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, greater, 12, 12);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, greater, 12, 34);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, greater, 34, 12);	};	\
    dprintf(2, " %s,", #STEM);								\
  }

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)									\
  {												\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, greater, 0.123, 0.123);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, greater, 0.123, 0.456);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, greater, 0.456, 0.123);	};	\
    dprintf(2, " %s,", #STEM);									\
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)										\
  {													\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE( STEM, greater, 0.1, 0.2, 0.1,  0.2);	};	\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE( STEM, greater, 0.1, 0.2, 0.3,  0.4);	};	\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE(  STEM, greater, 0.1, 0.2, 0.03, 0.04);	};	\
    dprintf(2, " %s,", #STEM);										\
  }

/* ------------------------------------------------------------------ */

  DOIT_FOR_EXACT_INTEGER(pointer);
  DOIT_FOR_EXACT_INTEGER(char);
  DOIT_FOR_EXACT_INTEGER(schar);
  DOIT_FOR_EXACT_INTEGER(uchar);
  DOIT_FOR_EXACT_INTEGER(sshort);
  DOIT_FOR_EXACT_INTEGER(ushort);
  DOIT_FOR_EXACT_INTEGER(sint);
  DOIT_FOR_EXACT_INTEGER(uint);
  DOIT_FOR_EXACT_INTEGER(slong);
  DOIT_FOR_EXACT_INTEGER(ulong);
  DOIT_FOR_EXACT_INTEGER(sllong);
  DOIT_FOR_EXACT_INTEGER(ullong);
  DOIT_FOR_EXACT_INTEGER(sint8);
  DOIT_FOR_EXACT_INTEGER(uint8);
  DOIT_FOR_EXACT_INTEGER(sint16);
  DOIT_FOR_EXACT_INTEGER(uint16);
  DOIT_FOR_EXACT_INTEGER(sint32);
  DOIT_FOR_EXACT_INTEGER(uint32);
  DOIT_FOR_EXACT_INTEGER(sint64);
  DOIT_FOR_EXACT_INTEGER(uint64);
  DOIT_FOR_EXACT_INTEGER(byte);
  DOIT_FOR_EXACT_INTEGER(octet);
  DOIT_FOR_EXACT_INTEGER(ssize);
  DOIT_FOR_EXACT_INTEGER(usize);
  DOIT_FOR_EXACT_INTEGER(sintmax);
  DOIT_FOR_EXACT_INTEGER(uintmax);
  DOIT_FOR_EXACT_INTEGER(sintptr);
  DOIT_FOR_EXACT_INTEGER(uintptr);
  DOIT_FOR_EXACT_INTEGER(mode);
  DOIT_FOR_EXACT_INTEGER(off);
  DOIT_FOR_EXACT_INTEGER(pid);
  DOIT_FOR_EXACT_INTEGER(uid);
  DOIT_FOR_EXACT_INTEGER(gid);
  DOIT_FOR_EXACT_INTEGER(ptrdiff);
  DOIT_FOR_EXACT_INTEGER(wchar);
  DOIT_FOR_EXACT_INTEGER(wint);
  DOIT_FOR_EXACT_INTEGER(time);
  DOIT_FOR_EXACT_INTEGER(socklen);
  DOIT_FOR_EXACT_INTEGER(rlim);

/* ------------------------------------------------------------------ */

  DOIT_FOR_FLONUM(flonumfl);
  DOIT_FOR_FLONUM(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FOR_FLONUM(flonumldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FOR_FLONUM(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FOR_FLONUM(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FOR_FLONUM(flonumf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FOR_FLONUM(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FOR_FLONUM(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FOR_FLONUM(flonumf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FOR_FLONUM(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_FLONUM(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_FLONUM(flonumd128);
#endif

/* ------------------------------------------------------------------ */

  DOIT_FOR_FLONUMC(flonumcfl);
  DOIT_FOR_FLONUMC(flonumcdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(flonumcldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(flonumcf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_comparison_less_equal (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_EXACT_INTEGER
#define DOIT_FOR_EXACT_INTEGER(STEM)								\
  {												\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, less_equal, 12, 12);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, less_equal, 12, 34);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, less_equal, 34, 12);	};	\
    dprintf(2, " %s,", #STEM);									\
  }

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)									\
  {												\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, less_equal, 0.123, 0.123);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, less_equal, 0.123, 0.456);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, less_equal, 0.456, 0.123);	};	\
    dprintf(2, " %s,", #STEM);									\
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)										\
  {													\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE(  STEM, less_equal, 0.1, 0.2, 0.1,  0.2);	};	\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE(  STEM, less_equal, 0.1, 0.2, 0.3,  0.4);	};	\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE( STEM, less_equal, 0.1, 0.2, 0.03, 0.04);	};	\
    dprintf(2, " %s,", #STEM);										\
  }

/* ------------------------------------------------------------------ */

  DOIT_FOR_EXACT_INTEGER(pointer);
  DOIT_FOR_EXACT_INTEGER(char);
  DOIT_FOR_EXACT_INTEGER(schar);
  DOIT_FOR_EXACT_INTEGER(uchar);
  DOIT_FOR_EXACT_INTEGER(sshort);
  DOIT_FOR_EXACT_INTEGER(ushort);
  DOIT_FOR_EXACT_INTEGER(sint);
  DOIT_FOR_EXACT_INTEGER(uint);
  DOIT_FOR_EXACT_INTEGER(slong);
  DOIT_FOR_EXACT_INTEGER(ulong);
  DOIT_FOR_EXACT_INTEGER(sllong);
  DOIT_FOR_EXACT_INTEGER(ullong);
  DOIT_FOR_EXACT_INTEGER(sint8);
  DOIT_FOR_EXACT_INTEGER(uint8);
  DOIT_FOR_EXACT_INTEGER(sint16);
  DOIT_FOR_EXACT_INTEGER(uint16);
  DOIT_FOR_EXACT_INTEGER(sint32);
  DOIT_FOR_EXACT_INTEGER(uint32);
  DOIT_FOR_EXACT_INTEGER(sint64);
  DOIT_FOR_EXACT_INTEGER(uint64);
  DOIT_FOR_EXACT_INTEGER(byte);
  DOIT_FOR_EXACT_INTEGER(octet);
  DOIT_FOR_EXACT_INTEGER(ssize);
  DOIT_FOR_EXACT_INTEGER(usize);
  DOIT_FOR_EXACT_INTEGER(sintmax);
  DOIT_FOR_EXACT_INTEGER(uintmax);
  DOIT_FOR_EXACT_INTEGER(sintptr);
  DOIT_FOR_EXACT_INTEGER(uintptr);
  DOIT_FOR_EXACT_INTEGER(mode);
  DOIT_FOR_EXACT_INTEGER(off);
  DOIT_FOR_EXACT_INTEGER(pid);
  DOIT_FOR_EXACT_INTEGER(uid);
  DOIT_FOR_EXACT_INTEGER(gid);
  DOIT_FOR_EXACT_INTEGER(ptrdiff);
  DOIT_FOR_EXACT_INTEGER(wchar);
  DOIT_FOR_EXACT_INTEGER(wint);
  DOIT_FOR_EXACT_INTEGER(time);
  DOIT_FOR_EXACT_INTEGER(socklen);
  DOIT_FOR_EXACT_INTEGER(rlim);

/* ------------------------------------------------------------------ */

  DOIT_FOR_FLONUM(flonumfl);
  DOIT_FOR_FLONUM(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FOR_FLONUM(flonumldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FOR_FLONUM(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FOR_FLONUM(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FOR_FLONUM(flonumf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FOR_FLONUM(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FOR_FLONUM(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FOR_FLONUM(flonumf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FOR_FLONUM(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_FLONUM(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_FLONUM(flonumd128);
#endif

/* ------------------------------------------------------------------ */

  DOIT_FOR_FLONUMC(flonumcfl);
  DOIT_FOR_FLONUMC(flonumcdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(flonumcldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(flonumcf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_comparison_greater_equal (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_EXACT_INTEGER
#define DOIT_FOR_EXACT_INTEGER(STEM)								\
  {												\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, greater_equal, 12, 12);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, greater_equal, 12, 34);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, greater_equal, 34, 12);	};	\
    dprintf(2, " %s,", #STEM);									\
  }

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)										\
  {													\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, greater_equal, 0.123, 0.123);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, greater_equal, 0.123, 0.456);	};	\
    if (1) { DOIT_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, greater_equal, 0.456, 0.123);	};	\
    dprintf(2, " %s,", #STEM);										\
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)											\
  {														\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE(  STEM, greater_equal, 0.1, 0.2, 0.1,  0.2);	};	\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE( STEM, greater_equal, 0.1, 0.2, 0.3,  0.4);	};	\
    if (1) { DOIT_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE(  STEM, greater_equal, 0.1, 0.2, 0.03, 0.04);	};	\
    dprintf(2, " %s,", #STEM);											\
  }

/* ------------------------------------------------------------------ */

  DOIT_FOR_EXACT_INTEGER(pointer);
  DOIT_FOR_EXACT_INTEGER(char);
  DOIT_FOR_EXACT_INTEGER(schar);
  DOIT_FOR_EXACT_INTEGER(uchar);
  DOIT_FOR_EXACT_INTEGER(sshort);
  DOIT_FOR_EXACT_INTEGER(ushort);
  DOIT_FOR_EXACT_INTEGER(sint);
  DOIT_FOR_EXACT_INTEGER(uint);
  DOIT_FOR_EXACT_INTEGER(slong);
  DOIT_FOR_EXACT_INTEGER(ulong);
  DOIT_FOR_EXACT_INTEGER(sllong);
  DOIT_FOR_EXACT_INTEGER(ullong);
  DOIT_FOR_EXACT_INTEGER(sint8);
  DOIT_FOR_EXACT_INTEGER(uint8);
  DOIT_FOR_EXACT_INTEGER(sint16);
  DOIT_FOR_EXACT_INTEGER(uint16);
  DOIT_FOR_EXACT_INTEGER(sint32);
  DOIT_FOR_EXACT_INTEGER(uint32);
  DOIT_FOR_EXACT_INTEGER(sint64);
  DOIT_FOR_EXACT_INTEGER(uint64);
  DOIT_FOR_EXACT_INTEGER(byte);
  DOIT_FOR_EXACT_INTEGER(octet);
  DOIT_FOR_EXACT_INTEGER(ssize);
  DOIT_FOR_EXACT_INTEGER(usize);
  DOIT_FOR_EXACT_INTEGER(sintmax);
  DOIT_FOR_EXACT_INTEGER(uintmax);
  DOIT_FOR_EXACT_INTEGER(sintptr);
  DOIT_FOR_EXACT_INTEGER(uintptr);
  DOIT_FOR_EXACT_INTEGER(mode);
  DOIT_FOR_EXACT_INTEGER(off);
  DOIT_FOR_EXACT_INTEGER(pid);
  DOIT_FOR_EXACT_INTEGER(uid);
  DOIT_FOR_EXACT_INTEGER(gid);
  DOIT_FOR_EXACT_INTEGER(ptrdiff);
  DOIT_FOR_EXACT_INTEGER(wchar);
  DOIT_FOR_EXACT_INTEGER(wint);
  DOIT_FOR_EXACT_INTEGER(time);
  DOIT_FOR_EXACT_INTEGER(socklen);
  DOIT_FOR_EXACT_INTEGER(rlim);

/* ------------------------------------------------------------------ */

  DOIT_FOR_FLONUM(flonumfl);
  DOIT_FOR_FLONUM(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FOR_FLONUM(flonumldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FOR_FLONUM(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FOR_FLONUM(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FOR_FLONUM(flonumf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FOR_FLONUM(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FOR_FLONUM(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FOR_FLONUM(flonumf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FOR_FLONUM(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_FLONUM(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_FLONUM(flonumd128);
#endif

/* ------------------------------------------------------------------ */

  DOIT_FOR_FLONUMC(flonumcfl);
  DOIT_FOR_FLONUMC(flonumcdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(flonumcldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(flonumcf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_comparison_min (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DO_MINMAX_FOR_EXACT_INTEGER
#define DO_MINMAX_FOR_EXACT_INTEGER(STEM)						\
  {											\
    if (1) { DO_MINMAX_FOR_THESE_REAL_NUMBERS_EXPECT_1ST( STEM, min, 12, 12);	};	\
    if (1) { DO_MINMAX_FOR_THESE_REAL_NUMBERS_EXPECT_1ST( STEM, min, 12, 34);	};	\
    if (1) { DO_MINMAX_FOR_THESE_REAL_NUMBERS_EXPECT_2ND( STEM, min, 34, 12);	};	\
    dprintf(2, " %s,", #STEM);								\
  }

#undef  DO_MINMAX_FOR_FLONUM
#define DO_MINMAX_FOR_FLONUM(STEM)								\
  {												\
    if (1) { DO_MINMAX_FOR_THESE_REAL_NUMBERS_EXPECT_1ST( STEM, min, 0.123, 0.123);	};	\
    if (1) { DO_MINMAX_FOR_THESE_REAL_NUMBERS_EXPECT_1ST( STEM, min, 0.123, 0.456);	};	\
    if (1) { DO_MINMAX_FOR_THESE_REAL_NUMBERS_EXPECT_2ND( STEM, min, 0.456, 0.123);	};	\
    dprintf(2, " %s,", #STEM);									\
  }

#undef  DO_MINMAX_FOR_FLONUMC
#define DO_MINMAX_FOR_FLONUMC(STEM)									\
  {													\
    if (1) { DO_MINMAX_FOR_THESE_CPLX_NUMBERS_EXPECT_1ST( STEM, min, 0.1, 0.2, 0.1,  0.2);	};	\
    if (1) { DO_MINMAX_FOR_THESE_CPLX_NUMBERS_EXPECT_1ST( STEM, min, 0.1, 0.2, 0.3,  0.4);	};	\
    if (1) { DO_MINMAX_FOR_THESE_CPLX_NUMBERS_EXPECT_2ND( STEM, min, 0.1, 0.2, 0.03, 0.04);	};	\
    dprintf(2, " %s,", #STEM);										\
  }

/* ------------------------------------------------------------------ */

  DO_MINMAX_FOR_EXACT_INTEGER(pointer);
  DO_MINMAX_FOR_EXACT_INTEGER(char);
  DO_MINMAX_FOR_EXACT_INTEGER(schar);
  DO_MINMAX_FOR_EXACT_INTEGER(uchar);
  DO_MINMAX_FOR_EXACT_INTEGER(sshort);
  DO_MINMAX_FOR_EXACT_INTEGER(ushort);
  DO_MINMAX_FOR_EXACT_INTEGER(sint);
  DO_MINMAX_FOR_EXACT_INTEGER(uint);
  DO_MINMAX_FOR_EXACT_INTEGER(slong);
  DO_MINMAX_FOR_EXACT_INTEGER(ulong);
  DO_MINMAX_FOR_EXACT_INTEGER(sllong);
  DO_MINMAX_FOR_EXACT_INTEGER(ullong);
  DO_MINMAX_FOR_EXACT_INTEGER(sint8);
  DO_MINMAX_FOR_EXACT_INTEGER(uint8);
  DO_MINMAX_FOR_EXACT_INTEGER(sint16);
  DO_MINMAX_FOR_EXACT_INTEGER(uint16);
  DO_MINMAX_FOR_EXACT_INTEGER(sint32);
  DO_MINMAX_FOR_EXACT_INTEGER(uint32);
  DO_MINMAX_FOR_EXACT_INTEGER(sint64);
  DO_MINMAX_FOR_EXACT_INTEGER(uint64);
  DO_MINMAX_FOR_EXACT_INTEGER(byte);
  DO_MINMAX_FOR_EXACT_INTEGER(octet);
  DO_MINMAX_FOR_EXACT_INTEGER(ssize);
  DO_MINMAX_FOR_EXACT_INTEGER(usize);
  DO_MINMAX_FOR_EXACT_INTEGER(sintmax);
  DO_MINMAX_FOR_EXACT_INTEGER(uintmax);
  DO_MINMAX_FOR_EXACT_INTEGER(sintptr);
  DO_MINMAX_FOR_EXACT_INTEGER(uintptr);
  DO_MINMAX_FOR_EXACT_INTEGER(mode);
  DO_MINMAX_FOR_EXACT_INTEGER(off);
  DO_MINMAX_FOR_EXACT_INTEGER(pid);
  DO_MINMAX_FOR_EXACT_INTEGER(uid);
  DO_MINMAX_FOR_EXACT_INTEGER(gid);
  DO_MINMAX_FOR_EXACT_INTEGER(ptrdiff);
  DO_MINMAX_FOR_EXACT_INTEGER(wchar);
  DO_MINMAX_FOR_EXACT_INTEGER(wint);
  DO_MINMAX_FOR_EXACT_INTEGER(time);
  DO_MINMAX_FOR_EXACT_INTEGER(socklen);
  DO_MINMAX_FOR_EXACT_INTEGER(rlim);

/* ------------------------------------------------------------------ */

  DO_MINMAX_FOR_FLONUM(flonumfl);
  DO_MINMAX_FOR_FLONUM(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DO_MINMAX_FOR_FLONUM(flonumldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DO_MINMAX_FOR_FLONUM(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DO_MINMAX_FOR_FLONUM(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DO_MINMAX_FOR_FLONUM(flonumf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DO_MINMAX_FOR_FLONUM(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DO_MINMAX_FOR_FLONUM(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DO_MINMAX_FOR_FLONUM(flonumf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DO_MINMAX_FOR_FLONUM(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DO_MINMAX_FOR_FLONUM(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DO_MINMAX_FOR_FLONUM(flonumd128);
#endif

/* ------------------------------------------------------------------ */

  DO_MINMAX_FOR_FLONUMC(flonumcfl);
  DO_MINMAX_FOR_FLONUMC(flonumcdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DO_MINMAX_FOR_FLONUMC(flonumcldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DO_MINMAX_FOR_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DO_MINMAX_FOR_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DO_MINMAX_FOR_FLONUMC(flonumcf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DO_MINMAX_FOR_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DO_MINMAX_FOR_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DO_MINMAX_FOR_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DO_MINMAX_FOR_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DO_MINMAX_FOR_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DO_MINMAX_FOR_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_comparison_max (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DO_MINMAX_FOR_EXACT_INTEGER
#define DO_MINMAX_FOR_EXACT_INTEGER(STEM)						\
  {											\
    if (1) { DO_MINMAX_FOR_THESE_REAL_NUMBERS_EXPECT_1ST( STEM, max, 12, 12);	};	\
    if (1) { DO_MINMAX_FOR_THESE_REAL_NUMBERS_EXPECT_2ND( STEM, max, 12, 34);	};	\
    if (1) { DO_MINMAX_FOR_THESE_REAL_NUMBERS_EXPECT_1ST( STEM, max, 34, 12);	};	\
    dprintf(2, " %s,", #STEM);								\
  }

#undef  DO_MINMAX_FOR_FLONUM
#define DO_MINMAX_FOR_FLONUM(STEM)								\
  {												\
    if (1) { DO_MINMAX_FOR_THESE_REAL_NUMBERS_EXPECT_1ST( STEM, max, 0.123, 0.123);	};	\
    if (1) { DO_MINMAX_FOR_THESE_REAL_NUMBERS_EXPECT_2ND( STEM, max, 0.123, 0.456);	};	\
    if (1) { DO_MINMAX_FOR_THESE_REAL_NUMBERS_EXPECT_1ST( STEM, max, 0.456, 0.123);	};	\
    dprintf(2, " %s,", #STEM);									\
  }

#undef  DO_MINMAX_FOR_FLONUMC
#define DO_MINMAX_FOR_FLONUMC(STEM)									\
  {													\
    if (1) { DO_MINMAX_FOR_THESE_CPLX_NUMBERS_EXPECT_1ST( STEM, max, 0.1, 0.2, 0.1,  0.2);	};	\
    if (1) { DO_MINMAX_FOR_THESE_CPLX_NUMBERS_EXPECT_2ND( STEM, max, 0.1, 0.2, 0.3,  0.4);	};	\
    if (1) { DO_MINMAX_FOR_THESE_CPLX_NUMBERS_EXPECT_1ST( STEM, max, 0.1, 0.2, 0.03, 0.04);	};	\
    dprintf(2, " %s,", #STEM);										\
  }

/* ------------------------------------------------------------------ */

  DO_MINMAX_FOR_EXACT_INTEGER(pointer);
  DO_MINMAX_FOR_EXACT_INTEGER(char);
  DO_MINMAX_FOR_EXACT_INTEGER(schar);
  DO_MINMAX_FOR_EXACT_INTEGER(uchar);
  DO_MINMAX_FOR_EXACT_INTEGER(sshort);
  DO_MINMAX_FOR_EXACT_INTEGER(ushort);
  DO_MINMAX_FOR_EXACT_INTEGER(sint);
  DO_MINMAX_FOR_EXACT_INTEGER(uint);
  DO_MINMAX_FOR_EXACT_INTEGER(slong);
  DO_MINMAX_FOR_EXACT_INTEGER(ulong);
  DO_MINMAX_FOR_EXACT_INTEGER(sllong);
  DO_MINMAX_FOR_EXACT_INTEGER(ullong);
  DO_MINMAX_FOR_EXACT_INTEGER(sint8);
  DO_MINMAX_FOR_EXACT_INTEGER(uint8);
  DO_MINMAX_FOR_EXACT_INTEGER(sint16);
  DO_MINMAX_FOR_EXACT_INTEGER(uint16);
  DO_MINMAX_FOR_EXACT_INTEGER(sint32);
  DO_MINMAX_FOR_EXACT_INTEGER(uint32);
  DO_MINMAX_FOR_EXACT_INTEGER(sint64);
  DO_MINMAX_FOR_EXACT_INTEGER(uint64);
  DO_MINMAX_FOR_EXACT_INTEGER(byte);
  DO_MINMAX_FOR_EXACT_INTEGER(octet);
  DO_MINMAX_FOR_EXACT_INTEGER(ssize);
  DO_MINMAX_FOR_EXACT_INTEGER(usize);
  DO_MINMAX_FOR_EXACT_INTEGER(sintmax);
  DO_MINMAX_FOR_EXACT_INTEGER(uintmax);
  DO_MINMAX_FOR_EXACT_INTEGER(sintptr);
  DO_MINMAX_FOR_EXACT_INTEGER(uintptr);
  DO_MINMAX_FOR_EXACT_INTEGER(mode);
  DO_MINMAX_FOR_EXACT_INTEGER(off);
  DO_MINMAX_FOR_EXACT_INTEGER(pid);
  DO_MINMAX_FOR_EXACT_INTEGER(uid);
  DO_MINMAX_FOR_EXACT_INTEGER(gid);
  DO_MINMAX_FOR_EXACT_INTEGER(ptrdiff);
  DO_MINMAX_FOR_EXACT_INTEGER(wchar);
  DO_MINMAX_FOR_EXACT_INTEGER(wint);
  DO_MINMAX_FOR_EXACT_INTEGER(time);
  DO_MINMAX_FOR_EXACT_INTEGER(socklen);
  DO_MINMAX_FOR_EXACT_INTEGER(rlim);

/* ------------------------------------------------------------------ */

  DO_MINMAX_FOR_FLONUM(flonumfl);
  DO_MINMAX_FOR_FLONUM(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DO_MINMAX_FOR_FLONUM(flonumldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DO_MINMAX_FOR_FLONUM(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DO_MINMAX_FOR_FLONUM(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DO_MINMAX_FOR_FLONUM(flonumf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DO_MINMAX_FOR_FLONUM(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DO_MINMAX_FOR_FLONUM(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DO_MINMAX_FOR_FLONUM(flonumf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DO_MINMAX_FOR_FLONUM(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DO_MINMAX_FOR_FLONUM(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DO_MINMAX_FOR_FLONUM(flonumd128);
#endif

/* ------------------------------------------------------------------ */

  DO_MINMAX_FOR_FLONUMC(flonumcfl);
  DO_MINMAX_FOR_FLONUMC(flonumcdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DO_MINMAX_FOR_FLONUMC(flonumcldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DO_MINMAX_FOR_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DO_MINMAX_FOR_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DO_MINMAX_FOR_FLONUMC(flonumcf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DO_MINMAX_FOR_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DO_MINMAX_FOR_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DO_MINMAX_FOR_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DO_MINMAX_FOR_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DO_MINMAX_FOR_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DO_MINMAX_FOR_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_comparison_equal_absmargin (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)									\
  {												\
    if (1) { DO_ABSMARGIN_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, 0.123, 0.123);	};	\
    if (1) { DO_ABSMARGIN_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, 0.123, 0.12309);	};	\
    if (1) { DO_ABSMARGIN_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, 0.123, 0.456);	};	\
    if (1) { DO_ABSMARGIN_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, 0.456, 0.123);	};	\
    dprintf(2, " %s,", #STEM);									\
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)										\
  {													\
    if (1) { DO_ABSMARGIN_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE( STEM, 0.1, 0.2, 0.1,  0.2);	};	\
    if (1) { DO_ABSMARGIN_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE( STEM, 0.1, 0.2, 0.1,  0.2009);	};	\
    if (1) { DO_ABSMARGIN_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE(STEM, 0.1, 0.2, 0.3,  0.4);	};	\
    if (1) { DO_ABSMARGIN_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE(STEM, 0.1, 0.2, 0.03, 0.04);	};	\
    dprintf(2, " %s,", #STEM);										\
  }

/* ------------------------------------------------------------------ */

  DOIT_FOR_FLONUM(flonumfl);
  DOIT_FOR_FLONUM(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FOR_FLONUM(flonumldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FOR_FLONUM(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FOR_FLONUM(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FOR_FLONUM(flonumf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FOR_FLONUM(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FOR_FLONUM(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FOR_FLONUM(flonumf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FOR_FLONUM(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_FLONUM(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_FLONUM(flonumd128);
#endif

/* ------------------------------------------------------------------ */

  DOIT_FOR_FLONUMC(flonumcfl);
  DOIT_FOR_FLONUMC(flonumcdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(flonumcldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(flonumcf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(flonumcd128);
#endif

  dprintf(2, " DONE.\n\n");
}


static void
test_comparison_equal_relepsilon (void)
{
  dprintf(2, "running test: %s:", __func__);

#undef  DOIT_FOR_FLONUM
#define DOIT_FOR_FLONUM(STEM)									\
  {												\
    if (1) { DO_RELEPSILON_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, 0.123, 0.123);	};	\
    if (1) { DO_RELEPSILON_FOR_THESE_REAL_NUMBERS_EXPECT_TRUE(  STEM, 0.123, 0.12309);	};	\
    if (1) { DO_RELEPSILON_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, 0.123, 0.456);	};	\
    if (1) { DO_RELEPSILON_FOR_THESE_REAL_NUMBERS_EXPECT_FALSE( STEM, 0.456, 0.123);	};	\
    dprintf(2, " %s,", #STEM);									\
  }

#undef  DOIT_FOR_FLONUMC
#define DOIT_FOR_FLONUMC(STEM)										\
  {													\
    if (1) { DO_RELEPSILON_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE( STEM, 0.1, 0.2, 0.1,  0.2);	};	\
    if (1) { DO_RELEPSILON_FOR_THESE_CPLX_NUMBERS_EXPECT_TRUE( STEM, 0.1, 0.2, 0.1,  0.200009);	};	\
    if (1) { DO_RELEPSILON_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE(STEM, 0.1, 0.2, 0.3,  0.4);	};	\
    if (1) { DO_RELEPSILON_FOR_THESE_CPLX_NUMBERS_EXPECT_FALSE(STEM, 0.1, 0.2, 0.03, 0.04);	};	\
    dprintf(2, " %s,", #STEM);										\
  }

/* ------------------------------------------------------------------ */

  DOIT_FOR_FLONUM(flonumfl);
  DOIT_FOR_FLONUM(flonumdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  DOIT_FOR_FLONUM(flonumldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  DOIT_FOR_FLONUM(flonumf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  DOIT_FOR_FLONUM(flonumf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  DOIT_FOR_FLONUM(flonumf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  DOIT_FOR_FLONUM(flonumf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  DOIT_FOR_FLONUM(flonumf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  DOIT_FOR_FLONUM(flonumf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  DOIT_FOR_FLONUM(flonumd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  DOIT_FOR_FLONUM(flonumd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  DOIT_FOR_FLONUM(flonumd128);
#endif

/* ------------------------------------------------------------------ */

  DOIT_FOR_FLONUMC(flonumcfl);
  DOIT_FOR_FLONUMC(flonumcdb);
#ifdef MMUX_CC_TYPES_HAS_FLONUMCLDB
  DOIT_FOR_FLONUMC(flonumcldb);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32
  DOIT_FOR_FLONUMC(flonumcf32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64
  DOIT_FOR_FLONUMC(flonumcf64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128
  DOIT_FOR_FLONUMC(flonumcf128);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCF32X
  DOIT_FOR_FLONUMC(flonumcf32x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF64X
  DOIT_FOR_FLONUMC(flonumcf64x);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCF128X
  DOIT_FOR_FLONUMC(flonumcf128x);
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMCD32
  DOIT_FOR_FLONUMC(flonumcd32);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD64
  DOIT_FOR_FLONUMC(flonumcd64);
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMCD128
  DOIT_FOR_FLONUMC(flonumcd128);
#endif

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

  if (1) {	test_comparison_equal();		}
  if (1) {	test_comparison_not_equal();		}
  if (1) {	test_comparison_less();			}
  if (1) {	test_comparison_greater();		}
  if (1) {	test_comparison_less_equal();		}
  if (1) {	test_comparison_greater_equal();	}

  if (1) {	test_comparison_min();			}
  if (1) {	test_comparison_max();			}

  if (1) {	test_comparison_equal_absmargin();	}
  if (1) {	test_comparison_equal_relepsilon();	}

  exit(EXIT_SUCCESS);
}

/* end of file */
