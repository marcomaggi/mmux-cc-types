/*
  Part of: MMUX CC Types
  Contents: common stuff for tests
  Date: Aug 19, 2025

  Abstract

	Common facilities for testing.

  Copyright (C) 2025 Marco Maggi <mrc.mgg@gmail.com>

  See the COPYING file.
*/


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#undef  _GNU_SOURCE
#define _GNU_SOURCE	1

#undef NDEBUG
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <mmux-cc-types.h>

#define BOOL_STRING(BOOL)	((true == BOOL)? "true" : "false")

static void test_set_output_formats (void)
  __attribute__((__unused__));

static void test_set_output_formats_verbose (bool verbose)
  __attribute__((__unused__));

static void dprintf_newline(int fd);


/** --------------------------------------------------------------------
 ** Numeric format helpers.
 ** ----------------------------------------------------------------- */

void
test_set_output_formats (void)
{
  test_set_output_formats_verbose(false);
}
void
test_set_output_formats_verbose (bool verbose)
{
  if (verbose) { dprintf(2, "%s: setting output format for flonumfl\n", __func__); }
  assert(false == mmux_flonumfl_set_output_format("%.6f", __func__));
  if (verbose) { dprintf(2, "%s: setting output format for flonumdb\n", __func__); }
  assert(false == mmux_flonumdb_set_output_format("%.6f", __func__));
#ifdef MMUX_CC_TYPES_HAS_FLONUMLDB
  if (verbose) { dprintf(2, "%s: setting output format for flonumldb\n", __func__); }
  assert(false == mmux_flonumldb_set_output_format("%.6f", __func__));
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32
  if (verbose) { dprintf(2, "%s: setting output format for flonumf32\n", __func__); }
  assert(false == mmux_flonumf32_set_output_format("%.6f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64
  if (verbose) { dprintf(2, "%s: setting output format for flonumf64\n", __func__); }
  assert(false == mmux_flonumf64_set_output_format("%.6f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128
  if (verbose) { dprintf(2, "%s: setting output format for flonumf128\n", __func__); }
  assert(false == mmux_flonumf128_set_output_format("%.6f", __func__));
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMF32X
  if (verbose) { dprintf(2, "%s: setting output format for flonumf32x\n", __func__); }
  assert(false == mmux_flonumf32x_set_output_format("%.6f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF64X
  if (verbose) { dprintf(2, "%s: setting output format for flonumf64x\n", __func__); }
  assert(false == mmux_flonumf64x_set_output_format("%.6f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMF128X
  if (verbose) { dprintf(2, "%s: setting output format for flonumf128x\n", __func__); }
  assert(false == mmux_flonumf128x_set_output_format("%.6f", __func__));
#endif

#ifdef MMUX_CC_TYPES_HAS_FLONUMD32
  if (verbose) { dprintf(2, "%s: setting output format for flonumd32\n", __func__); }
  assert(false == mmux_flonumd32_set_output_format("%.6f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD64
  if (verbose) { dprintf(2, "%s: setting output format for flonumd64\n", __func__); }
  assert(false == mmux_flonumd64_set_output_format("%.6f", __func__));
#endif
#ifdef MMUX_CC_TYPES_HAS_FLONUMD128
  if (verbose) { dprintf(2, "%s: setting output format for flonumd128\n", __func__); }
  assert(false == mmux_flonumd128_set_output_format("%.6f", __func__));
#endif
}


/** --------------------------------------------------------------------
 ** Printing helpers.
 ** ----------------------------------------------------------------- */

MMUX_CC_TYPES_UNUSED void
dprintf_newline (int fd)
{
  dprintf(fd, "\n");
}


/** --------------------------------------------------------------------
 ** Macros: comparing expected results with got results.
 ** ----------------------------------------------------------------- */

#undef  UNARY_EXACT_COMPARISON
#define UNARY_EXACT_COMPARISON(STEM,FUNC,OP,EROP,ROP)				\
  {										\
    if (mmux_##STEM##_not_equal(EROP,ROP)) {					\
      dprintf(2, "\n*** %s: for %s expected %s(", __func__, #STEM, #FUNC);	\
      mmux_ctype_dprintf(2, OP);						\
      dprintf(2, ")=");								\
      mmux_ctype_dprintf(2, EROP);						\
      dprintf(2, " got ");							\
      mmux_ctype_dprintf(2, ROP);						\
      dprintf(2, "\n");								\
      exit(EXIT_FAILURE);							\
    }										\
  }

#undef  BINARY_EXACT_COMPARISON
#define BINARY_EXACT_COMPARISON(STEM,FUNC,OP1,OP2,EROP,ROP)			\
  {										\
    if (mmux_##STEM##_not_equal(EROP,ROP)) {					\
      dprintf(2, "\n*** %s: for %s expected %s(", __func__, #STEM, #FUNC);	\
      mmux_ctype_dprintf(2, OP1);						\
      dprintf(2, ", ");								\
      mmux_ctype_dprintf(2, OP2);						\
      dprintf(2, ")=");								\
      mmux_ctype_dprintf(2, EROP);						\
      dprintf(2, " got ");							\
      mmux_ctype_dprintf(2, ROP);						\
      dprintf(2, "\n");								\
      exit(EXIT_FAILURE);							\
    }										\
  }

/* ------------------------------------------------------------------ */

#undef  UNARY_FLONUM_COMPARISON
#define UNARY_FLONUM_COMPARISON(STEM,FUNC,OP,EROP,ROP)				\
  {										\
    auto	eps = mmux_##STEM##_literal(1e-3);				\
    if (! mmux_##STEM##_equal_relepsilon(EROP,ROP,eps)) {			\
      dprintf(2, "\n*** %s: for %s expected %s(", __func__, #STEM, #FUNC);	\
      mmux_ctype_dprintf(2, OP);						\
      dprintf(2, ")=");								\
      mmux_ctype_dprintf(2, EROP);						\
      dprintf(2, " got ");							\
      mmux_ctype_dprintf(2, ROP);						\
      dprintf(2, "\n");								\
      exit(EXIT_FAILURE);							\
    }										\
  }

#undef  BINARY_FLONUM_COMPARISON
#define BINARY_FLONUM_COMPARISON(STEM,FUNC,OP1,OP2,EROP,ROP)			\
  {										\
    auto	eps = mmux_##STEM##_literal(1e-3);				\
    if (! mmux_##STEM##_equal_relepsilon(EROP,ROP,eps)) {			\
      dprintf(2, "\n*** %s: for %s expected %s(", __func__, #STEM, #FUNC);	\
      mmux_ctype_dprintf(2, OP1);						\
      dprintf(2, ", ");								\
      mmux_ctype_dprintf(2, OP2);						\
      dprintf(2, ")=");								\
      mmux_ctype_dprintf(2, EROP);						\
      dprintf(2, " got ");							\
      mmux_ctype_dprintf(2, ROP);						\
      dprintf(2, "\n");								\
      exit(EXIT_FAILURE);							\
    }										\
  }

/* ------------------------------------------------------------------ */

#undef  UNARY_FLONUMC_COMPARISON
#define UNARY_FLONUMC_COMPARISON(STEM,FUNC,OP,EROP,ROP)				\
  {										\
    auto	eps = mmux_##STEM##_rectangular_literal(1e-3,1e-3);		\
    if (! mmux_##STEM##_equal_relepsilon(EROP,ROP,eps)) {			\
      dprintf(2, "\n*** %s: for %s expected %s(", __func__, #STEM, #FUNC);	\
      mmux_ctype_dprintf(2, OP);						\
      dprintf(2, ")=");								\
      mmux_ctype_dprintf(2, EROP);						\
      dprintf(2, " got ");							\
      mmux_ctype_dprintf(2, ROP);						\
      dprintf(2, "\n");								\
      exit(EXIT_FAILURE);							\
    }										\
  }

#undef  BINARY_FLONUMC_COMPARISON
#define BINARY_FLONUMC_COMPARISON(STEM,FUNC,OP1,OP2,EROP,ROP)			\
  {										\
    auto	eps = mmux_##STEM##_rectangular_literal(1e-3,1e-3);		\
    if (! mmux_##STEM##_equal_relepsilon(EROP,ROP,eps)) {			\
      dprintf(2, "\n*** %s: for %s expected %s(", __func__, #STEM, #FUNC);	\
      mmux_ctype_dprintf(2, OP1);						\
      dprintf(2, ", ");								\
      mmux_ctype_dprintf(2, OP2);						\
      dprintf(2, ")=");								\
      mmux_ctype_dprintf(2, EROP);						\
      dprintf(2, " got ");							\
      mmux_ctype_dprintf(2, ROP);						\
      dprintf(2, "\n");								\
      exit(EXIT_FAILURE);							\
    }										\
  }


/** --------------------------------------------------------------------
 ** Macros: performing functions calls for exact integers, flonums, flonumcs
 ** ----------------------------------------------------------------- */

#undef  PERFORM_CALL_P
#define PERFORM_CALL_P(THE_CALL)							\
  {											\
    if (THE_CALL) {									\
      dprintf(2, "\n*** %s: returned error from pointers API function\n", __func__);	\
    }											\
  }

/* ------------------------------------------------------------------ */

#undef  UNARY_INTEGER_FUNC
#define UNARY_INTEGER_FUNC(STEM,FUNC,LITERAL,ELITERAL)			\
  {									\
    auto		op   = mmux_##STEM## _literal(LITERAL);		\
    auto		erop = mmux_##STEM## _literal(ELITERAL);	\
    auto		rop1 = mmux_##STEM##_##FUNC(op);		\
    auto		rop2 = mmux_ctype_##FUNC(op);			\
    typeof(rop1)	rop3;						\
    typeof(rop1)	rop4;						\
    PERFORM_CALL_P(mmux_##STEM##_##FUNC##_p(&rop3,&op));		\
    PERFORM_CALL_P(mmux_ctype_##FUNC##_p(&rop4,&op));			\
    UNARY_EXACT_COMPARISON(STEM,FUNC,op,erop,rop1);			\
    UNARY_EXACT_COMPARISON(STEM,FUNC,op,erop,rop2);			\
    UNARY_EXACT_COMPARISON(STEM,FUNC,op,erop,rop3);			\
    UNARY_EXACT_COMPARISON(STEM,FUNC,op,erop,rop4);			\
  }

#undef  BINARY_INTEGER_FUNC
#define BINARY_INTEGER_FUNC(STEM,FUNC,LITERAL1,LITERAL2,ELITERAL)	\
  {									\
    auto	op1  = mmux_##STEM## _literal(LITERAL1);		\
    auto	op2  = mmux_##STEM## _literal(LITERAL2);		\
    auto	erop = mmux_##STEM## _literal(ELITERAL);		\
    auto	rop1 = mmux_##STEM##_##FUNC(op1, op2);			\
    auto	rop2 = mmux_ctype_##FUNC(op1, op2);			\
    typeof(rop1)	rop3;						\
    typeof(rop1)	rop4;						\
    PERFORM_CALL_P(mmux_##STEM##_##FUNC##_p(&rop3,&op1,&op2));		\
    PERFORM_CALL_P(mmux_ctype_##FUNC##_p(&rop4,&op1,&op2));		\
    BINARY_EXACT_COMPARISON(STEM,FUNC,op1,op2,erop,rop1);		\
    BINARY_EXACT_COMPARISON(STEM,FUNC,op1,op2,erop,rop2);		\
    BINARY_EXACT_COMPARISON(STEM,FUNC,op1,op2,erop,rop3);		\
    BINARY_EXACT_COMPARISON(STEM,FUNC,op1,op2,erop,rop4);		\
  }

/* ------------------------------------------------------------------ */

#undef  UNARY_FLONUM_FUNC
#define UNARY_FLONUM_FUNC(STEM,FUNC,LITERAL,ELITERAL)			\
  {									\
    auto		op   = mmux_##STEM## _literal(LITERAL);		\
    auto		erop = mmux_##STEM## _literal(ELITERAL);	\
    auto		rop1 = mmux_##STEM##_##FUNC(op);		\
    auto		rop2 = mmux_ctype_##FUNC(op);			\
    typeof(rop1)	rop3;						\
    typeof(rop1)	rop4;						\
    PERFORM_CALL_P(mmux_##STEM##_##FUNC##_p(&rop3,&op));		\
    PERFORM_CALL_P(mmux_ctype_##FUNC##_p(&rop4,&op));			\
    UNARY_FLONUM_COMPARISON(STEM,FUNC,op,erop,rop1);			\
    UNARY_FLONUM_COMPARISON(STEM,FUNC,op,erop,rop2);			\
    UNARY_FLONUM_COMPARISON(STEM,FUNC,op,erop,rop3);			\
    UNARY_FLONUM_COMPARISON(STEM,FUNC,op,erop,rop4);			\
  }

#undef  BINARY_FLONUM_FUNC
#define BINARY_FLONUM_FUNC(STEM,FUNC,LITERAL1,LITERAL2,ELITERAL)	\
  {									\
    auto		op1  = mmux_##STEM## _literal(LITERAL1);	\
    auto		op2  = mmux_##STEM## _literal(LITERAL2);	\
    auto		erop = mmux_##STEM## _literal(ELITERAL);	\
    auto		rop1 = mmux_##STEM##_##FUNC(op1, op2);		\
    auto		rop2 = mmux_ctype_##FUNC(op1, op2);		\
    typeof(rop1)	rop3;						\
    typeof(rop1)	rop4;						\
    PERFORM_CALL_P(mmux_##STEM##_##FUNC##_p(&rop3,&op1,&op2));		\
    PERFORM_CALL_P(mmux_ctype_##FUNC##_p(&rop4,&op1,&op2));		\
    BINARY_FLONUM_COMPARISON(STEM,FUNC,op1,op2,erop,rop1);		\
    BINARY_FLONUM_COMPARISON(STEM,FUNC,op1,op2,erop,rop2);		\
    BINARY_FLONUM_COMPARISON(STEM,FUNC,op1,op2,erop,rop3);		\
    BINARY_FLONUM_COMPARISON(STEM,FUNC,op1,op2,erop,rop4);		\
  }

/* ------------------------------------------------------------------ */

#undef  UNARY_FLONUMC_FUNC
#define UNARY_FLONUMC_FUNC(STEM,FUNC,								\
			   LITERAL_RE,LITERAL_IM,						\
			   ELITERAL_RE,ELITERAL_IM)						\
  {												\
    auto		op   = mmux_##STEM##_rectangular_literal(LITERAL_RE,LITERAL_IM);	\
    auto		erop = mmux_##STEM##_rectangular_literal(ELITERAL_RE,ELITERAL_IM);	\
    auto		rop1 = mmux_##STEM##_##FUNC(op);					\
    auto		rop2 = mmux_ctype_##FUNC(op);						\
    typeof(rop1)	rop3;									\
    typeof(rop1)	rop4;									\
    PERFORM_CALL_P(mmux_##STEM##_##FUNC##_p(&rop3,&op));					\
    PERFORM_CALL_P(mmux_ctype_##FUNC##_p(&rop4,&op));						\
    UNARY_FLONUMC_COMPARISON(STEM,FUNC,op,erop,rop1);						\
    UNARY_FLONUMC_COMPARISON(STEM,FUNC,op,erop,rop2);						\
    UNARY_FLONUMC_COMPARISON(STEM,FUNC,op,erop,rop3);						\
    UNARY_FLONUMC_COMPARISON(STEM,FUNC,op,erop,rop4);						\
  }

#undef  BINARY_FLONUMC_FUNC
#define BINARY_FLONUMC_FUNC(STEM,FUNC,								\
			    LITERAL_RE1,LITERAL_IM1,						\
			    LITERAL_RE2,LITERAL_IM2,						\
			    ELITERAL_RE,ELITERAL_IM)						\
  {												\
    auto		op1  = mmux_##STEM##_rectangular_literal(LITERAL_RE1,LITERAL_IM1);	\
    auto		op2  = mmux_##STEM##_rectangular_literal(LITERAL_RE2,LITERAL_IM2);	\
    auto		erop = mmux_##STEM##_rectangular_literal(ELITERAL_RE,ELITERAL_IM);	\
    auto		rop1 = mmux_##STEM##_##FUNC(op1, op2);					\
    auto		rop2 = mmux_ctype_##FUNC(op1, op2);					\
    typeof(rop1)	rop3;									\
    typeof(rop1)	rop4;									\
    PERFORM_CALL_P(mmux_##STEM##_##FUNC##_p(&rop3,&op1,&op2));					\
    PERFORM_CALL_P(mmux_ctype_##FUNC##_p(&rop4,&op1,&op2));					\
    BINARY_FLONUMC_COMPARISON(STEM,FUNC,op1,op2,erop,rop1);					\
    BINARY_FLONUMC_COMPARISON(STEM,FUNC,op1,op2,erop,rop2);					\
    BINARY_FLONUMC_COMPARISON(STEM,FUNC,op1,op2,erop,rop3);					\
    BINARY_FLONUMC_COMPARISON(STEM,FUNC,op1,op2,erop,rop4);					\
  }

/* ------------------------------------------------------------------ */

#undef  UNARY_FLONUMC_TO_FLONUM_FUNC
#define UNARY_FLONUMC_TO_FLONUM_FUNC(CSTEM,RSTEM,FUNC,						\
				     LITERAL_RE,LITERAL_IM,					\
				     ELITERAL)							\
  {												\
    auto		op   = mmux_##CSTEM##_rectangular_literal(LITERAL_RE,LITERAL_IM);	\
    auto		erop = mmux_##RSTEM##_literal(ELITERAL);				\
    auto		rop1 = mmux_##CSTEM##_##FUNC(op);					\
    auto		rop2 = mmux_ctype_##FUNC(op);						\
    typeof(erop)	rop3;									\
    typeof(erop)	rop4;									\
    PERFORM_CALL_P(mmux_##CSTEM##_##FUNC##_p(&rop3,&op));					\
    PERFORM_CALL_P(mmux_ctype_##FUNC##_p(&rop4,&op));						\
    UNARY_FLONUM_COMPARISON(RSTEM,FUNC,op,erop,rop1);						\
    UNARY_FLONUM_COMPARISON(RSTEM,FUNC,op,erop,rop2);						\
    UNARY_FLONUM_COMPARISON(RSTEM,FUNC,op,erop,rop3);						\
    UNARY_FLONUM_COMPARISON(RSTEM,FUNC,op,erop,rop4);						\
  }

#undef  BINARY_FLONUMC_TO_FLONUM_FUNC
#define BINARY_FLONUMC_TO_FLONUM_FUNC(CSTEM,RSTEM,FUNC,						\
				      LITERAL_RE1,LITERAL_IM1,					\
				      LITERAL_RE2,LITERAL_IM2,					\
				      ELITERAL)							\
  {												\
    auto		op1  = mmux_##CSTEM##_rectangular_literal(LITERAL_RE1,LITERAL_IM1);	\
    auto		op2  = mmux_##CSTEM##_rectangular_literal(LITERAL_RE2,LITERAL_IM2);	\
    auto		erop = mmux_##RSTEM##_literal(LITERAL);					\
    auto		rop1 = mmux_##CSTEM##_##FUNC(op1, op2);					\
    auto		rop2 = mmux_ctype_##FUNC(op1, op2);					\
    typeof(erop)	rop3;									\
    typeof(erop)	rop4;									\
    PERFORM_CALL_P(mmux_##CSTEM##_##FUNC##_p(&rop3,&op1,&op2));					\
    PERFORM_CALL_P(mmux_ctype_##FUNC##_p(&rop4,&op1,&op2));					\
    BINARY_FLONUM_COMPARISON(RSTEM,FUNC,op1,op2,erop,rop1);					\
    BINARY_FLONUM_COMPARISON(RSTEM,FUNC,op1,op2,erop,rop2);					\
    BINARY_FLONUM_COMPARISON(RSTEM,FUNC,op1,op2,erop,rop3);					\
    BINARY_FLONUM_COMPARISON(RSTEM,FUNC,op1,op2,erop,rop4);					\
  }

/* end of file */
