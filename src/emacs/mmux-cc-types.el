;;; mmux-cc-types.el --- support for programming MMUX CC Types under GNU Emacs

;; Copyright (C) 2024, 2025  Marco Maggi

;; Author: Marco Maggi <mrc.mgg@gmail.com>
;; Created: 2024
;; Keywords: languages

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

;; Add-on to c-mode that supports the MMUX CC Types.

;;; Change Log:

;;

;;; Code:

(defface mmux-cc-types-function-face
  `((t (:foreground "spring green")))
  "Shell mode custom face used for MMUX CC Types functions."
  :group 'c
  :group 'font-lock-faces)

(defconst mmux-cc-types-function-face
  'mmux-cc-types-function-face
  "Shell mode custom face used for MMUX CC Types functions.")


(defconst mmux-cc-types-known-functions-ctypes
  (eval-when-compile
    (regexp-opt
     '("mmux_ctype_add"
       "mmux_ctype_sub"
       "mmux_ctype_mul"
       "mmux_ctype_div"
       "mmux_ctype_mod"
       "mmux_ctype_neg"
       "mmux_ctype_inv"
       "mmux_ctype_incr"
       "mmux_ctype_decr"
       "mmux_ctype_abs"
       "mmux_ctype_bitwise_and"
       "mmux_ctype_bitwise_or"
       "mmux_ctype_bitwise_xor"
       "mmux_ctype_bitwise_not"
       "mmux_ctype_bitwise_shl"
       "mmux_ctype_bitwise_shr"
       "mmux_ctype_is_zero"
       "mmux_ctype_is_positive"
       "mmux_ctype_is_negative"
       "mmux_ctype_is_non_positive"
       "mmux_ctype_is_non_negative"
       "mmux_ctype_is_nan"
       "mmux_ctype_is_infinite"
       "mmux_ctype_equal"
       "mmux_ctype_greater"
       "mmux_ctype_less"
       "mmux_ctype_greater_equal"
       "mmux_ctype_less_equal"
       "mmux_ctype_min"
       "mmux_ctype_max"
       )
     'symbols)))


(defconst mmux-cc-types-known-functions-pointer
  (eval-when-compile
    (regexp-opt
     '("mmux_pointer_add"
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
       "mmux_pointer_equal"
       "mmux_pointer_greater"
       "mmux_pointer_less"
       "mmux_pointer_greater_equal"
       "mmux_pointer_less_equal"
       "mmux_pointer_min"
       "mmux_pointer_max"
       )
     'symbols)))


(defconst mmux-cc-types-known-functions-schar
  (eval-when-compile
    (regexp-opt
     '("mmux_schar_add"
       "mmux_schar_sub"
       "mmux_schar_mul"
       "mmux_schar_div"
       "mmux_schar_mod"
       "mmux_schar_neg"
       "mmux_schar_inv"
       "mmux_schar_incr"
       "mmux_schar_decr"
       "mmux_schar_abs"
       "mmux_schar_bitwise_and"
       "mmux_schar_bitwise_or"
       "mmux_schar_bitwise_xor"
       "mmux_schar_bitwise_not"
       "mmux_schar_bitwise_shl"
       "mmux_schar_bitwise_shr"
       "mmux_schar_is_zero"
       "mmux_schar_is_positive"
       "mmux_schar_is_negative"
       "mmux_schar_is_non_positive"
       "mmux_schar_is_non_negative"
       "mmux_schar_is_nan"
       "mmux_schar_is_infinite"
       "mmux_schar_equal"
       "mmux_schar_greater"
       "mmux_schar_less"
       "mmux_schar_greater_equal"
       "mmux_schar_less_equal"
       "mmux_schar_min"
       "mmux_schar_max"
       )
     'symbols)))


(defconst mmux-cc-types-known-functions-uchar
  (eval-when-compile
    (regexp-opt
     '("mmux_uchar_add"
       "mmux_uchar_sub"
       "mmux_uchar_mul"
       "mmux_uchar_div"
       "mmux_uchar_mod"
       "mmux_uchar_neg"
       "mmux_uchar_inv"
       "mmux_uchar_incr"
       "mmux_uchar_decr"
       "mmux_uchar_abs"
       "mmux_uchar_bitwise_and"
       "mmux_uchar_bitwise_or"
       "mmux_uchar_bitwise_xor"
       "mmux_uchar_bitwise_not"
       "mmux_uchar_bitwise_shl"
       "mmux_uchar_bitwise_shr"
       "mmux_uchar_is_zero"
       "mmux_uchar_is_positive"
       "mmux_uchar_is_negative"
       "mmux_uchar_is_non_positive"
       "mmux_uchar_is_non_negative"
       "mmux_uchar_is_nan"
       "mmux_uchar_is_infinite"
       "mmux_uchar_equal"
       "mmux_uchar_greater"
       "mmux_uchar_less"
       "mmux_uchar_greater_equal"
       "mmux_uchar_less_equal"
       "mmux_uchar_min"
       "mmux_uchar_max"
       )
     'symbols)))


(defconst mmux-cc-types-known-functions-sshort
  (eval-when-compile
    (regexp-opt
     '("mmux_sshort_add"
       "mmux_sshort_sub"
       "mmux_sshort_mul"
       "mmux_sshort_div"
       "mmux_sshort_mod"
       "mmux_sshort_neg"
       "mmux_sshort_inv"
       "mmux_sshort_incr"
       "mmux_sshort_decr"
       "mmux_sshort_abs"
       "mmux_sshort_bitwise_and"
       "mmux_sshort_bitwise_or"
       "mmux_sshort_bitwise_xor"
       "mmux_sshort_bitwise_not"
       "mmux_sshort_bitwise_shl"
       "mmux_sshort_bitwise_shr"
       "mmux_sshort_is_zero"
       "mmux_sshort_is_positive"
       "mmux_sshort_is_negative"
       "mmux_sshort_is_non_positive"
       "mmux_sshort_is_non_negative"
       "mmux_sshort_is_nan"
       "mmux_sshort_is_infinite"
       "mmux_sshort_equal"
       "mmux_sshort_greater"
       "mmux_sshort_less"
       "mmux_sshort_greater_equal"
       "mmux_sshort_less_equal"
       "mmux_sshort_min"
       "mmux_sshort_max"
       )
     'symbols)))


(defconst mmux-cc-types-known-functions-ushort
  (eval-when-compile
    (regexp-opt
     '("mmux_ushort_add"
       "mmux_ushort_sub"
       "mmux_ushort_mul"
       "mmux_ushort_div"
       "mmux_ushort_mod"
       "mmux_ushort_neg"
       "mmux_ushort_inv"
       "mmux_ushort_incr"
       "mmux_ushort_decr"
       "mmux_ushort_abs"
       "mmux_ushort_bitwise_and"
       "mmux_ushort_bitwise_or"
       "mmux_ushort_bitwise_xor"
       "mmux_ushort_bitwise_not"
       "mmux_ushort_bitwise_shl"
       "mmux_ushort_bitwise_shr"
       "mmux_ushort_is_zero"
       "mmux_ushort_is_positive"
       "mmux_ushort_is_negative"
       "mmux_ushort_is_non_positive"
       "mmux_ushort_is_non_negative"
       "mmux_ushort_is_nan"
       "mmux_ushort_is_infinite"
       "mmux_ushort_equal"
       "mmux_ushort_greater"
       "mmux_ushort_less"
       "mmux_ushort_greater_equal"
       "mmux_ushort_less_equal"
       "mmux_ushort_min"
       "mmux_ushort_max"
       )
     'symbols)))


(defconst mmux-cc-types-known-functions-sint
  (eval-when-compile
    (regexp-opt
     '("mmux_sint_add"
       "mmux_sint_sub"
       "mmux_sint_mul"
       "mmux_sint_div"
       "mmux_sint_mod"
       "mmux_sint_neg"
       "mmux_sint_inv"
       "mmux_sint_incr"
       "mmux_sint_decr"
       "mmux_sint_abs"
       "mmux_sint_bitwise_and"
       "mmux_sint_bitwise_or"
       "mmux_sint_bitwise_xor"
       "mmux_sint_bitwise_not"
       "mmux_sint_bitwise_shl"
       "mmux_sint_bitwise_shr"
       "mmux_sint_is_zero"
       "mmux_sint_is_positive"
       "mmux_sint_is_negative"
       "mmux_sint_is_non_positive"
       "mmux_sint_is_non_negative"
       "mmux_sint_is_nan"
       "mmux_sint_is_infinite"
       "mmux_sint_equal"
       "mmux_sint_greater"
       "mmux_sint_less"
       "mmux_sint_greater_equal"
       "mmux_sint_less_equal"
       "mmux_sint_min"
       "mmux_sint_max"
       )
     'symbols)))


(defconst mmux-cc-types-known-functions-uint
  (eval-when-compile
    (regexp-opt
     '("mmux_uint_add"
       "mmux_uint_sub"
       "mmux_uint_mul"
       "mmux_uint_div"
       "mmux_uint_mod"
       "mmux_uint_neg"
       "mmux_uint_inv"
       "mmux_uint_incr"
       "mmux_uint_decr"
       "mmux_uint_abs"
       "mmux_uint_bitwise_and"
       "mmux_uint_bitwise_or"
       "mmux_uint_bitwise_xor"
       "mmux_uint_bitwise_not"
       "mmux_uint_bitwise_shl"
       "mmux_uint_bitwise_shr"
       "mmux_uint_is_zero"
       "mmux_uint_is_positive"
       "mmux_uint_is_negative"
       "mmux_uint_is_non_positive"
       "mmux_uint_is_non_negative"
       "mmux_uint_is_nan"
       "mmux_uint_is_infinite"
       "mmux_uint_equal"
       "mmux_uint_greater"
       "mmux_uint_less"
       "mmux_uint_greater_equal"
       "mmux_uint_less_equal"
       "mmux_uint_min"
       "mmux_uint_max"
       )
     'symbols)))


;;;; let's go

;;We perform this  call to `font-lock-add-keywords' at  the top-level, so the  configuration is done
;;only once at file-loading time.
;;
(font-lock-add-keywords
    ;;This argument MODE  is set to `c-mode' because  this call is performed at  the top-level.  See
    ;;the documentation of `font-lock-add-keywords' for details.
    'c-mode

  ;;Here  we need  to  remember that  "(regexp-opt  ... 'symbols)"  encloses  the generated  regular
  ;;expression between  '\_<\(' and  '\)\_>' so  the SUBEXP  number must  be 1  to match  the actual
  ;;symbol.
  ;;
  `((,mmux-cc-types-known-functions-ctypes 1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-known-functions-pointer 1 mmux-cc-types-function-face keep)

    (,mmux-cc-types-known-functions-schar 1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-known-functions-uchar 1 mmux-cc-types-function-face keep)

    (,mmux-cc-types-known-functions-sshort 1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-known-functions-ushort 1 mmux-cc-types-function-face keep)

    (,mmux-cc-types-known-functions-sint 1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-known-functions-uint 1 mmux-cc-types-function-face keep)
    )

  ;;This  true value  as HOW  argument causes  this specification  to be  appended to  the value  of
  ;;`font-lock-keywords'.
  ;;
  ;;We need it to  allow correct fontification of known function names, which  must happen after the
  ;;fontification built into `c-mode'.
  t)

(provide 'mmux-cc-types)
;;; mmux-cc-types.el ends here
