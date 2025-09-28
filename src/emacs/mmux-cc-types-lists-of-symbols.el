;;; mmux-cc-types-lists-of-symbols.el --- definition of lists of symbols for MMUX CC Types

;; Copyright (C) 2025 Marco Maggi

;; Author: Marco Maggi <mrc.mgg@gmail.com>
;; Created: Aug 14, 2025
;; Time-stamp: <2025-09-28 08:24:28 marco>
;; Keywords: convenience, data, languages

;; This file is part of MMUX CC Types.
;;
;; This program is  free software: you can redistribute  it and/or modify it under the  terms of the
;; GNU General Public License as published by the  Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without
;; even the implied  warranty of MERCHANTABILITY or  FITNESS FOR A PARTICULAR PURPOSE.   See the GNU
;; General Public License for more details.
;;
;; You should have  received a copy of the  GNU General Public License along with  this program.  If
;; not, see <http://www.gnu.org/licenses/>.
;;

;;; Commentary:

;; This file is to be  loaded, for example, by the code defining font locking  rules for the MMUX CC
;; Types package.

;;; Change Log:

;;

;;; Code:

;;(setq debug-on-error t)


(defconst mmux-cc-types-font-lock-list/known-generic-macros/complex
  '("mmux_ctype_rectangular"
    "mmux_ctype_real_part"
    "mmux_ctype_imag_part"
    "mmux_ctype_argument"))

(defconst mmux-cc-types-font-lock-list/known-generic-macros/arithmetics
  '("mmux_ctype_add"
    "mmux_ctype_sub"
    "mmux_ctype_mul"
    "mmux_ctype_div"
    "mmux_ctype_mod"
    "mmux_ctype_neg"
    "mmux_ctype_inv"
    "mmux_ctype_incr"
    "mmux_ctype_decr"
    "mmux_ctype_absolute"
    "mmux_ctype_add_to_variable"
    "mmux_ctype_sub_from_variable"
    "mmux_ctype_incr_variable"
    "mmux_ctype_decr_variable"))

(defconst mmux-cc-types-font-lock-list/known-generic-macros/bitwise
  '("mmux_ctype_bitwise_and"
    "mmux_ctype_bitwise_or"
    "mmux_ctype_bitwise_xor"
    "mmux_ctype_bitwise_not"
    "mmux_ctype_bitwise_shl"
    "mmux_ctype_bitwise_shr"))

(defconst mmux-cc-types-font-lock-list/known-generic-macros/predicates
  '("mmux_ctype_is_zero"
    "mmux_ctype_is_positive"
    "mmux_ctype_is_negative"
    "mmux_ctype_is_non_positive"
    "mmux_ctype_is_non_negative"
    "mmux_ctype_is_nan"
    "mmux_ctype_is_infinite"
    "mmux_ctype_is_unsigned"))

(defconst mmux-cc-types-font-lock-list/known-generic-macros/comparison
  '("mmux_ctype_equal"
    "mmux_ctype_greater"
    "mmux_ctype_less"
    "mmux_ctype_greater_equal"
    "mmux_ctype_less_equal"
    "mmux_ctype_min"
    "mmux_ctype_max"
    "mmux_ctype_equal_absmargin"
    "mmux_ctype_equal_relepsilon"))

(defconst mmux-cc-types-font-lock-list/known-generic-macros/mathematics
  '("mmux_ctype_sin"
    "mmux_ctype_cos"
    "mmux_ctype_tan"
    "mmux_ctype_asin"
    "mmux_ctype_acos"
    "mmux_ctype_atan"
    "mmux_ctype_atan2"
    "mmux_ctype_sinh"
    "mmux_ctype_cosh"
    "mmux_ctype_tanh"
    "mmux_ctype_asinh"
    "mmux_ctype_acosh"
    "mmux_ctype_atanh"
    "mmux_ctype_exp"
    "mmux_ctype_exp2"
    "mmux_ctype_exp10"
    "mmux_ctype_log"
    "mmux_ctype_log10"
    "mmux_ctype_log2"
    "mmux_ctype_logb"
    "mmux_ctype_pow"
    "mmux_ctype_sqrt"
    "mmux_ctype_cbrt"
    "mmux_ctype_hypot"
    "mmux_ctype_expm1"
    "mmux_ctype_log1p"
    "mmux_ctype_erf"
    "mmux_ctype_erfc"
    "mmux_ctype_lgamma"
    "mmux_ctype_tgamma"
    "mmux_ctype_j0"
    "mmux_ctype_j1"
    "mmux_ctype_jn"
    "mmux_ctype_y0"
    "mmux_ctype_y1"
    "mmux_ctype_yn"))

(defconst mmux-cc-types-font-lock-list/known-generic-macros/stringrep
  '("mmux_ctype_dprintf"
    "mmux_ctype_fprintf"
    "mmux_ctype_parse"
    "mmux_ctype_sprint"
    "mmux_ctype_sprint_size"
    "mmux_ctype_sprint_with_base"
    "mmux_ctype_dprintf_with_base"))

(defconst mmux-cc-types-font-lock-list/known-generic-macros/miscellaneous
  '("mmux_ctype_sizeof"
    "mmux_ctype_constant_minimum"
    "mmux_ctype_constant_maximum"
    "mmux_ctype_constant_zero"
    "mmux_ctype_constant_one"))

(defconst mmux-cc-types-font-lock-rex/known-generic-macros/complex
  (regexp-opt mmux-cc-types-font-lock-list/known-generic-macros/complex 'symbols))
(defconst mmux-cc-types-font-lock-rex/known-generic-macros/arithmetics
  (regexp-opt mmux-cc-types-font-lock-list/known-generic-macros/arithmetics 'symbols))
(defconst mmux-cc-types-font-lock-rex/known-generic-macros/bitwise
  (regexp-opt mmux-cc-types-font-lock-list/known-generic-macros/bitwise 'symbols))
(defconst mmux-cc-types-font-lock-rex/known-generic-macros/predicates
  (regexp-opt mmux-cc-types-font-lock-list/known-generic-macros/predicates 'symbols))
(defconst mmux-cc-types-font-lock-rex/known-generic-macros/comparison
  (regexp-opt mmux-cc-types-font-lock-list/known-generic-macros/comparison 'symbols))
(defconst mmux-cc-types-font-lock-rex/known-generic-macros/mathematics
  (regexp-opt mmux-cc-types-font-lock-list/known-generic-macros/mathematics 'symbols))
(defconst mmux-cc-types-font-lock-rex/known-generic-macros/stringrep
  (regexp-opt mmux-cc-types-font-lock-list/known-generic-macros/stringrep 'symbols))
(defconst mmux-cc-types-font-lock-rex/known-generic-macros/miscellaneous
  (regexp-opt mmux-cc-types-font-lock-list/known-generic-macros/miscellaneous 'symbols))


(defconst mmux-cc-types-font-lock-list/known-functions-misc
  '("mmux_cc_types_init"
    "mmux_cc_types_version_string"
    "mmux_cc_types_version_interface_current"
    "mmux_cc_types_version_interface_revision"
    "mmux_cc_types_version_interface_age"
    "mmux_strtod32"
    "mmux_strtod64"
    "mmux_strtod128"
    "mmux_ctype_generic_error"
    ))

(defconst mmux-cc-types-font-lock-rex/known-functions-misc
  (regexp-opt mmux-cc-types-font-lock-list/known-functions-misc 'symbols))


(defconst mmux-cc-types-font-lock-list/known-functions-pointer
  '("mmux_pointer"
    "mmux_pointer_literal"
    "mmux_pointer_add"
    "mmux_pointer_sub"
    "mmux_pointer_bitwise_and"
    "mmux_pointer_bitwise_or"
    "mmux_pointer_bitwise_xor"
    "mmux_pointer_bitwise_not"
    "mmux_pointer_bitwise_shl"
    "mmux_pointer_bitwise_shr"
    "mmux_pointer_is_zero"
    "mmux_pointer_is_positive"
    "mmux_pointer_is_negative"
    "mmux_pointer_is_non_positive"
    "mmux_pointer_is_non_negative"
    "mmux_pointer_is_nan"
    "mmux_pointer_is_infinite"
    "mmux_pointer_is_unsigned"
    "mmux_pointer_equal"
    "mmux_pointer_greater"
    "mmux_pointer_less"
    "mmux_pointer_greater_equal"
    "mmux_pointer_less_equal"
    "mmux_pointer_min"
    "mmux_pointer_max"
    "mmux_pointer_sizeof"
    "mmux_pointer_minimum"
    "mmux_pointer_maximum"
    "mmux_pointer_dprintf"
    "mmux_pointer_fprintf"
    "mmux_pointer_parse"
    "mmux_pointer_sprint"
    "mmux_pointer_sprint_size"
    "mmux_pointer_sprint_with_base"
    "mmux_pointer_dprintf_with_base"
    ))

(defconst mmux-cc-types-font-lock-rex/known-functions-pointer
  (regexp-opt mmux-cc-types-font-lock-list/known-functions-pointer 'symbols))


(eval-and-compile
  (defconst mmux-cc-types-known-function-names/arithmetics
    '("add"
      "sub"
      "mul"
      "div"
      "mod"
      "neg"
      "inv"
      "incr"
      "decr"
      "absolute"))

  (defconst mmux-cc-types-known-function-names/bitwise
    '("bitwise_and"
      "bitwise_or"
      "bitwise_xor"
      "bitwise_not"
      "bitwise_shl"
      "bitwise_shr"))

  (defconst mmux-cc-types-known-function-names/predicates
    '("is_zero"
      "is_positive"
      "is_negative"
      "is_non_positive"
      "is_non_negative"
      "is_nan"
      "is_infinite"
      "is_unsigned"))

  (defconst mmux-cc-types-known-function-names/comparison
    '("equal"
      "greater"
      "less"
      "greater_equal"
      "less_equal"
      "min"
      "max"))

  (defconst mmux-cc-types-known-function-names/mathematics
    '("sin"
      "cos"
      "tan"
      "asin"
      "acos"
      "atan"
      "sinh"
      "cosh"
      "tanh"
      "asinh"
      "acosh"
      "atanh"
      "exp"
      "exp2"
      "exp10"
      "log"
      "log10"
      "log2"
      "pow"
      "sqrt"
      "cbrt"
      ))

  (defconst mmux-cc-types-known-function-names/mathematics/real
    '("atan2"
      "hypot"
      "logb"
      "expm1"
      "log1p"
      "erf"
      "erfc"
      "lgamma"
      "tgamma"
      "j0"
      "j1"
      "jn"
      "y0"
      "y1"
      "yn"
      "constant_E"
      "constant_LOG2E"
      "constant_LOG10E"
      "constant_LN2"
      "constant_LN10"
      "constant_PI"
      "constant_PI_2"
      "constant_PI_4"
      "constant_1_PI"
      "constant_2_PI"
      "constant_2_SQRTPI"
      "constant_SQRT2"
      "constant_SQRT1_2"))

  (defconst mmux-cc-types-known-function-names/stringrep
    '("dprintf"
      "fprintf"
      "parse"
      "sprint"
      "sprint_size"
      "sprint_with_base"
      "dprintf_with_base"))

  (defconst mmux-cc-types-known-function-names/stringrep/flonum
    '("set_output_format"
      "ref_output_format"
      "save_output_format"))

  (defconst mmux-cc-types-known-function-names/miscellaneous
    '("make"
      "sizeof"
      "minimum"
      "maximum"))

  (defconst mmux-cc-types-known-function-names/complex
    '("rectangular"
      "real_part"
      "imag_part"
      "argument"
      "conjugate"))

  (defconst mmux-cc-types-known-function-names/integer
    (append mmux-cc-types-known-function-names/arithmetics
	    mmux-cc-types-known-function-names/bitwise
	    mmux-cc-types-known-function-names/predicates
	    mmux-cc-types-known-function-names/comparison
	    mmux-cc-types-known-function-names/stringrep
	    mmux-cc-types-known-function-names/miscellaneous))

  (defconst mmux-cc-types-known-function-names/flonum
    (append mmux-cc-types-known-function-names/arithmetics
	    mmux-cc-types-known-function-names/bitwise
	    mmux-cc-types-known-function-names/predicates
	    mmux-cc-types-known-function-names/comparison
	    mmux-cc-types-known-function-names/mathematics
	    mmux-cc-types-known-function-names/mathematics/real
	    mmux-cc-types-known-function-names/stringrep
	    mmux-cc-types-known-function-names/stringrep/flonum
	    mmux-cc-types-known-function-names/miscellaneous))

  (defconst mmux-cc-types-known-function-names/complex
    (append mmux-cc-types-known-function-names/arithmetics
	    mmux-cc-types-known-function-names/bitwise
	    mmux-cc-types-known-function-names/predicates
	    mmux-cc-types-known-function-names/comparison
	    mmux-cc-types-known-function-names/mathematics
	    mmux-cc-types-known-function-names/stringrep
	    mmux-cc-types-known-function-names/miscellaneous
	    mmux-cc-types-known-function-names/complex)))

(defmacro mmux-cc-type-define-integer-list (STEM)
  "Define the list of functions to highlight for the given type stem."
  (let ((ELISP-LIST-NAME	(intern (format "mmux-cc-types-font-lock-list/known-functions-%s" STEM)))
	(ELISP-REX-NAME		(intern (format "mmux-cc-types-font-lock-rex/known-functions-%s"  STEM)))
	(LIST-OF-STRINGS	(append (list (format "mmux_%s" STEM)
					      (format "mmux_%s_literal" STEM)
					      (format "mmux_standard_%s_literal" STEM))
					(mapcar #'(lambda (FUNCNAME)
						    (format "mmux_%s_%s" STEM FUNCNAME))
						mmux-cc-types-known-function-names/integer))))
    (let ((OUTPUT-FORM		`(progn
				   (defconst ,ELISP-LIST-NAME (quote ,LIST-OF-STRINGS))
				   (defconst ,ELISP-REX-NAME  (regexp-opt ,ELISP-LIST-NAME 'symbols)))))
      ;;(pp OUTPUT-FORM)
      OUTPUT-FORM)))

(defmacro mmux-cc-type-define-flonum-list (STEM)
  "Define the list of functions to highlight for the given type stem."
  (let ((ELISP-LIST-NAME	(intern (format "mmux-cc-types-font-lock-list/known-functions-%s" STEM)))
	(ELISP-REX-NAME		(intern (format "mmux-cc-types-font-lock-rex/known-functions-%s"  STEM)))
	(LIST-OF-STRINGS	(append (list (format "mmux_%s" STEM)
					      (format "mmux_%s_literal" STEM)
					      (format "mmux_standard_%s_literal" STEM))
					(mapcar #'(lambda (FUNCNAME)
						    (format "mmux_%s_%s" STEM FUNCNAME))
						mmux-cc-types-known-function-names/flonum))))
    (let ((OUTPUT-FORM		`(progn
				   (defconst ,ELISP-LIST-NAME (quote ,LIST-OF-STRINGS))
				   (defconst ,ELISP-REX-NAME  (regexp-opt ,ELISP-LIST-NAME 'symbols)))))
      ;;(pp OUTPUT-FORM)
      OUTPUT-FORM)))

(defmacro mmux-cc-type-define-complex-list (STEM)
  "Define the list of functions to highlight for the given type stem."
  (let ((ELISP-LIST-NAME	(intern (format "mmux-cc-types-font-lock-list/known-functions-%s" STEM)))
	(ELISP-REX-NAME		(intern (format "mmux-cc-types-font-lock-rex/known-functions-%s"  STEM)))
	(LIST-OF-STRINGS	(append (list (format "mmux_%s" STEM)
					      (format "mmux_%s_literal" STEM)
					      (format "mmux_standard_%s_literal" STEM))
					(mapcar #'(lambda (FUNCNAME)
						    (format "mmux_%s_%s" STEM FUNCNAME))
						mmux-cc-types-known-function-names/complex))))
    (let ((OUTPUT-FORM		`(progn
				   (defconst ,ELISP-LIST-NAME (quote ,LIST-OF-STRINGS))
				   (defconst ,ELISP-REX-NAME  (regexp-opt ,ELISP-LIST-NAME 'symbols)))))
      ;;(pp OUTPUT-FORM)
      OUTPUT-FORM)))

(mmux-cc-type-define-integer-list char)
(mmux-cc-type-define-integer-list schar)
(mmux-cc-type-define-integer-list uchar)

(mmux-cc-type-define-integer-list sshort)
(mmux-cc-type-define-integer-list ushort)

(mmux-cc-type-define-integer-list sint)
(mmux-cc-type-define-integer-list uint)

(mmux-cc-type-define-integer-list slong)
(mmux-cc-type-define-integer-list ulong)

(mmux-cc-type-define-integer-list sllong)
(mmux-cc-type-define-integer-list ullong)

(mmux-cc-type-define-integer-list sint8)
(mmux-cc-type-define-integer-list uint8)

(mmux-cc-type-define-integer-list sint16)
(mmux-cc-type-define-integer-list uint16)

(mmux-cc-type-define-integer-list sint32)
(mmux-cc-type-define-integer-list uint32)

(mmux-cc-type-define-integer-list sint64)
(mmux-cc-type-define-integer-list uint64)

(mmux-cc-type-define-integer-list ssize)
(mmux-cc-type-define-integer-list usize)

(mmux-cc-type-define-integer-list sintmax)
(mmux-cc-type-define-integer-list uintmax)

(mmux-cc-type-define-integer-list sintptr)
(mmux-cc-type-define-integer-list uintptr)

(mmux-cc-type-define-integer-list ptrdiff)
(mmux-cc-type-define-integer-list off)
(mmux-cc-type-define-integer-list mode)
(mmux-cc-type-define-integer-list pid)
(mmux-cc-type-define-integer-list uid)
(mmux-cc-type-define-integer-list gid)
(mmux-cc-type-define-integer-list wchar)
(mmux-cc-type-define-integer-list wint)
(mmux-cc-type-define-integer-list time)
(mmux-cc-type-define-integer-list socklen)
(mmux-cc-type-define-integer-list rlim)

(mmux-cc-type-define-integer-list ino)
(mmux-cc-type-define-integer-list dev)
(mmux-cc-type-define-integer-list nlink)
(mmux-cc-type-define-integer-list blkcnt)

(mmux-cc-type-define-flonum-list flonumfl)
(mmux-cc-type-define-flonum-list flonumdb)
(mmux-cc-type-define-flonum-list flonumldb)

(mmux-cc-type-define-flonum-list flonumf32)
(mmux-cc-type-define-flonum-list flonumf64)
(mmux-cc-type-define-flonum-list flonumf128)

(mmux-cc-type-define-flonum-list flonumf32x)
(mmux-cc-type-define-flonum-list flonumf64x)
(mmux-cc-type-define-flonum-list flonumf128x)

(mmux-cc-type-define-flonum-list flonumd32)
(mmux-cc-type-define-flonum-list flonumd64)
(mmux-cc-type-define-flonum-list flonumd128)

(mmux-cc-type-define-complex-list flonumcfl)
(mmux-cc-type-define-complex-list flonumcdb)
(mmux-cc-type-define-complex-list flonumcldb)

(mmux-cc-type-define-complex-list flonumcf32)
(mmux-cc-type-define-complex-list flonumcf64)
(mmux-cc-type-define-complex-list flonumcf128)

(mmux-cc-type-define-complex-list flonumcf32x)
(mmux-cc-type-define-complex-list flonumcf64x)
(mmux-cc-type-define-complex-list flonumcf128x)

(mmux-cc-type-define-complex-list flonumcd32)
(mmux-cc-type-define-complex-list flonumcd64)
(mmux-cc-type-define-complex-list flonumcd128)


;;;; done

(provide 'mmux-cc-types-lists-of-symbols)
;;; mmux-cc-types-lists-of-symbols.el ends here
