;;; prelude-custom.el --- Emacs Prelude: Prelude's customizable variables.
;;
;; Copyright © 2011-2013 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: https://github.com/bbatsov/prelude
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Refinements of the core editing experience in Emacs.

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

;; customize
(defgroup prelude nil
  "Emacs Prelude configuration."
  :prefix "prelude-"
  :group 'convenience)

(defcustom prelude-auto-save t
  "Non-nil values enable Prelude's auto save."
  :type 'boolean
  :group 'prelude)

(defcustom prelude-guru t
  "Non-nil values enable `guru-mode'."
  :type 'boolean
  :group 'prelude)

(defcustom prelude-whitespace t
  "Non-nil values enable Prelude's whitespace visualization."
  :type 'boolean
  :group 'prelude)

(defcustom prelude-clean-whitespace-on-save t
  "Cleanup whitespace from file before it's saved.
Will only occur if `prelude-whitespace' is also enabled."
  :type 'boolean
  :group 'prelude)

(defcustom prelude-flyspell t
  "Non-nil values enable Prelude's flyspell support."
  :type 'boolean
  :group 'prelude)

(defcustom prelude-user-init-file (expand-file-name "personal/"
                                                    user-emacs-directory)
  "Path to your personal customization file.
Prelude recommends you only put personal customizations in the
personal folder.  This variable allows you to specify a specific
folder as the one that should be visited when running
`prelude-find-user-init-file'.  This can be easily set to the desired buffer
in lisp by putting `(setq prelude-user-init-file load-file-name)'
in the desired elisp file."
  :type 'string
  :group 'prelude)

(defcustom prelude-indent-sensitive-modes
  '(conf-mode coffee-mode haml-mode python-mode slim-mode yaml-mode)
  "Modes for which auto-indenting is suppressed."
  :type 'list
  :group 'prelude)

(defcustom prelude-yank-indent-modes '(LaTeX-mode TeX-mode)
  "Modes in which to indent regions that are yanked (or yank-popped).
Only modes that don't derive from `prog-mode' should be listed here."
  :type 'list
  :group 'prelude)

(defcustom prelude-yank-indent-threshold 1000
  "Threshold (# chars) over which indentation does not automatically occur."
  :type 'number
  :group 'prelude)

(defcustom prelude-theme 'zenburn
  "The default color theme, change this in your /personal/preload config."
  :type 'symbol
  :group 'prelude)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; custom addtional

(setq inhibit-splash-screen nil)

;; my calendar
(add-to-list 'load-path "~/projects/shadowine/")
(load "shadowine")

;; common setting
(set-default-font "Monaco-14")
(global-linum-mode 1)
(global-set-key (kbd "RET") 'newline-and-indent)
(setq indent-tabs-mode t)
(setq tab-width 4)

;; color themes
(add-to-list 'load-path "~/.emacs.d/personal/themes/")
(load "atom-dark-theme")
(require 'atom-dark-theme)


;;(add-to-list 'load-path "~/.emacs.d/personal/moe-theme/")

;;(add-to-list 'load-path "~/.emacs.d/personal/themes/zonokai-emacs/")
;;(load "moe-dark-theme")
;;(setq moe-theme-resize-org-title
;;      '(2.2 1.8 1.6 1.4 1.2 1.0 1.0 1.0 1.0))
;;; mode-lineをオレンジにする
;; (サポートしている他の色: blue, orange, green ,magenta, yellow, purple, red, cyan, w/b)
;;(setq moe-theme-mode-line-color 'orange)
;;(require 'moe-dark-theme)




;; (load "zonokai")
;;(require 'zonokai)

;;; Programming language custom
(add-to-list 'load-path "~/.emacs.d/personal/")
(load "julia-mode")

;; load R mode
(add-to-list 'load-path "~/.emacs.d/personal/ESS-master/lisp/")
(load "ess-site")
(require 'ess-site)

;; load jade template mode
(add-to-list 'load-path "~/.emacs.d/personal/jade-mode")
(require 'sws-mode)
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.styl\\'" . sws-mode))

;; load rust mode
(add-to-list 'load-path "~/.emacs.d/personal/rust-mode/")
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))


(provide 'prelude-custom)
;;; prelude-custom.el ends here
