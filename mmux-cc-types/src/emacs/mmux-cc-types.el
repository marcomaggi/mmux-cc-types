;;; mmux-bash-packages.el --- support for programming MMUX Bash Packages under GNU Emacs

;; Copyright (C) 2024  Marco Maggi

;; Author: Marco Maggi <mrc.mgg@gmail.com>
;; Created: 2024
;; Keywords: languages

;; This file is part of MMUX Bash Packages.
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

;; Add-on to shell mode that supports the MMUX Bash Packages.

;;; Change Log:

;;

;;; Code:

(defface mmux-bash-packages-function-face
  `((t (:foreground "spring green")))
  "Shell mode custom face used for MMUX Bash Packages functions."
  :group 'sh
  :group 'font-lock-faces)

(defconst mmux-bash-packages-function-face
  'mmux-bash-packages-function-face
  "Shell mode custom face used for MMUX Bash Packages functions.")

(defconst mmux-bash-packages-known-constants
  (eval-when-compile
    (regexp-opt
     '("MMUX_BASH_PACKAGES_PACKAGE" ;This is a variable not a constant.
       )
     'symbols))
  "This is for shell constants and shell variables.")

(defconst mmux-bash-packages-known-functions
  (eval-when-compile
    (regexp-opt
     '("mmux_package_exit_because_error_loading_package"
       "mmux_package_return_success"
       "mmux_package_return_failure"
       ;;
       "mmux_package_descriptor_is_registered"
       "mmux_package_descriptor_is_registered_as_broken"
       "mmux_package_descriptor_is_registered_as_loaded"
       "mmux_package_descriptor_is_registered_as_provided"
       "mmux_package_forget_descriptor"
       "mmux_package_register_descriptor_as_broken"
       "mmux_package_register_descriptor_as_loaded"
       "mmux_package_register_descriptor_as_provided"
       ;;
       "mmux_package_option_disable_load_when_provide"
       "mmux_package_option_enable_load_when_provide"
       "mmux_package_option_load_when_provide_is_enabled"
       "mmux_package_provide_by_descriptor"

       ;; loading
       "mmux_package_descriptor_has_builtins_to_enable"
       "mmux_package_descriptor_has_shared_library"
       "mmux_package_enable_builtins"
       "mmux_package_ignore_enable_builtin_errors_is_enabled"
       "mmux_package_load_by_descriptor"
       "mmux_package_option_disable_ignore_enable_builtin_errors"
       "mmux_package_option_enable_ignore_enable_builtin_errors"
       "mmux_package_run_descriptor_after_loading_hook"

       ;; unloading
       "mmux_package_descriptor_has_builtins_to_disable"
       "mmux_package_disable_builtins"
       "mmux_package_run_descriptor_before_unloading_hook"
       "mmux_package_unload_by_descriptor"
       ;;
       "mmux_package_check_packaging_version"
       ;;
       "mmux_package_string_is_identifier"
       "mmux_package_string_is_shell_library_filename"
       ;;
       "mmux_package_option_debug_mode_is_enabled"
       "mmux_package_option_disable_debug_mode"
       "mmux_package_option_disable_verbose_mode"
       "mmux_package_option_enable_debug_mode"
       "mmux_package_option_enable_verbose_mode"
       "mmux_package_option_verbose_mode_is_enabled"
       "mmux_package_print_debug_message"
       "mmux_package_print_error_message"
       "mmux_package_print_verbose_message"
       "mmux_package_print_warning_message"
       )
     'symbols)))

;;We perform this  call to `font-lock-add-keywords' at  the top-level, so the  configuration is done
;;only once at file-loading time.
;;
(font-lock-add-keywords
    ;;This argument MODE is  set to `sh-mode' because this call is performed  at the top-level.  See
    ;;the documentation of `font-lock-add-keywords' for details.
    'sh-mode

  ;;Here  we need  to  remember that  "(regexp-opt  ... 'symbols)"  encloses  the generated  regular
  ;;expression between  '\_<\(' and  '\)\_>' so  the SUBEXP  number must  be 1  to match  the actual
  ;;symbol.
  ;;
  `((,mmux-bash-packages-known-functions 1 mmux-bash-packages-function-face keep)
    (,mmux-bash-packages-known-constants 1 font-lock-constant-face keep))

  ;;This  true value  as HOW  argument causes  this specification  to be  appended to  the value  of
  ;;`font-lock-keywords'.
  ;;
  ;;We need it to  allow correct fontification of known function names, which  must happen after the
  ;;fontification built into `sh-mode'.
  t)

(provide 'mmux-bash-packages)
;;; mmux-bash-packages.el ends here
