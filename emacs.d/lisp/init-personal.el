;;; init-personal ---  Personal configurations

;; Copyright (C) 2018 Charis-Nicolas Georgiou

;; Author: Charis-Nicolas Georgiou <moksha@fenrir>
;; Created: 16 Apr 2018
;; Version: 1.0
;; Keywords: personal dotfiles
;; X-URL: https://github.com/jwiegley/dotfiles

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;;; Code:


(setq user-full-name "Charis-Nicolas Georgiou"
      user-mail-address "cng_it@posteo.net")
(save-place-mode)
(add-hook 'before-save-hook 'save-place-kill-emacs-hook)
(setq epa-pinentry-mode 'loopback) ; This will fail if gpg>=2.1 is not available.
(when (require 'pinentry nil t)
(pinentry-start))
(provide 'init-personal)

;;; init-personal.el ends here
