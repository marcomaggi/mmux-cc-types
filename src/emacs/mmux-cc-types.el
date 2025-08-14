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

;;(eval-when-compile
;;  (require 'mmux-cc-types-lists-of-symbols))

(require 'mmux-cc-types-lists-of-symbols)

(defface mmux-cc-types-function-face
  `((t (:foreground "spring green")))
  "Shell mode custom face used for MMUX CC Types functions."
  :group 'c
  :group 'font-lock-faces)

(defconst mmux-cc-types-function-face
  'mmux-cc-types-function-face
  "Shell mode custom face used for MMUX CC Types functions.")


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
  `((,mmux-cc-types-font-lock-rex/known-functions-misc			1 mmux-cc-types-function-face keep)

    (,mmux-cc-types-font-lock-rex/known-generic-macros/arithmetics	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-generic-macros/bitwise		1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-generic-macros/predicates	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-generic-macros/comparison	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-generic-macros/mathematics	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-generic-macros/stringrep	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-generic-macros/miscellaneous	1 mmux-cc-types-function-face keep)

    (,mmux-cc-types-font-lock-rex/known-functions-pointer	1 mmux-cc-types-function-face keep)

    (,mmux-cc-types-font-lock-rex/known-functions-char		1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-schar		1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-uchar		1 mmux-cc-types-function-face keep)

    (,mmux-cc-types-font-lock-rex/known-functions-sshort	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-ushort	1 mmux-cc-types-function-face keep)

    (,mmux-cc-types-font-lock-rex/known-functions-sint		1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-uint		1 mmux-cc-types-function-face keep)

    (,mmux-cc-types-font-lock-rex/known-functions-slong		1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-ulong		1 mmux-cc-types-function-face keep)

    (,mmux-cc-types-font-lock-rex/known-functions-sllong	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-ullong	1 mmux-cc-types-function-face keep)

    (,mmux-cc-types-font-lock-rex/known-functions-sint8		1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-uint8		1 mmux-cc-types-function-face keep)

    (,mmux-cc-types-font-lock-rex/known-functions-sint16	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-uint16	1 mmux-cc-types-function-face keep)

    (,mmux-cc-types-font-lock-rex/known-functions-sint32	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-uint32	1 mmux-cc-types-function-face keep)

    (,mmux-cc-types-font-lock-rex/known-functions-sint64	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-uint64	1 mmux-cc-types-function-face keep)

    (,mmux-cc-types-font-lock-rex/known-functions-ssize		1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-usize		1 mmux-cc-types-function-face keep)

    (,mmux-cc-types-font-lock-rex/known-functions-sintmax	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-uintmax	1 mmux-cc-types-function-face keep)

    (,mmux-cc-types-font-lock-rex/known-functions-sintptr	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-uintptr	1 mmux-cc-types-function-face keep)

    (,mmux-cc-types-font-lock-rex/known-functions-ptrdiff	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-off		1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-mode		1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-pid		1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-uid		1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-gid		1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-wchar		1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-wint		1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-time		1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-socklen	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-rlim		1 mmux-cc-types-function-face keep)

    (,mmux-cc-types-font-lock-rex/known-functions-float		1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-double	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-ldouble	1 mmux-cc-types-function-face keep)

    (,mmux-cc-types-font-lock-rex/known-functions-float32	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-float64	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-float128	1 mmux-cc-types-function-face keep)

    (,mmux-cc-types-font-lock-rex/known-functions-float32x	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-float64x	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-float128x	1 mmux-cc-types-function-face keep)

    (,mmux-cc-types-font-lock-rex/known-functions-decimal32	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-decimal64	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-decimal128	1 mmux-cc-types-function-face keep)

    (,mmux-cc-types-font-lock-rex/known-functions-complexf	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-complexd	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-complexld	1 mmux-cc-types-function-face keep)

    (,mmux-cc-types-font-lock-rex/known-functions-complexf32	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-complexf64	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-complexf128	1 mmux-cc-types-function-face keep)

    (,mmux-cc-types-font-lock-rex/known-functions-complexf32x	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-complexf64x	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-complexf128x	1 mmux-cc-types-function-face keep)

    (,mmux-cc-types-font-lock-rex/known-functions-complexd32	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-complexd64	1 mmux-cc-types-function-face keep)
    (,mmux-cc-types-font-lock-rex/known-functions-complexd128	1 mmux-cc-types-function-face keep)
    )

  ;;This  true value  as HOW  argument causes  this specification  to be  appended to  the value  of
  ;;`font-lock-keywords'.
  ;;
  ;;We need it to  allow correct fontification of known function names, which  must happen after the
  ;;fontification built into `c-mode'.
  t)

(provide 'mmux-cc-types)
;;; mmux-cc-types.el ends here
