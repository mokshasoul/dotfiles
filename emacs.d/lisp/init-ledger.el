;;; init-ledger --- Config file for ledger

;; Copyright (C) 2018 Charis-Nicolas Georgiou

;; Author: Charis-Nicolas Georgiou <moksha@fenrir>
;; Created: 15 Apr 2018
;; Version: 1.0
;; Keywords: ledger config dotfile
;; X-URL: https://github.com/mokshasoul/dotfiles

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
(use-package hledger-mode
  :after htmlize
  :mode ("\\.journal\\'" "\\.hledger\\'")
  :commands hledger-enable-reporting
  :preface
  (defun hledger/next-entry ()
    "Move to next entry and pulse."
    (interactive)
    (hledger-next-or-new-entry)
    (hledger-pulse-momentary-current-entry))

  (defface hledger-warning-face
    '((((background dark))
       :background "Red" :foreground "White")
      (((background light))
       :background "Red" :foreground "White")
      (t :inverse-video t))
    "Face for warning"
    :group 'hledger)

  (defun hledger/prev-entry ()
    "Move to last entry and pulse."
    (interactive)
    (hledger-backward-entry)
    (hledger-pulse-momentary-current-entry))

  :bind (("C-c j" . hledger-run-command)
         :map hledger-mode-map
         ("C-c e" . hledger-jentry)
         ("M-p" . hledger/prev-entry)
         ("M-n" . hledger/next-entry))
  :init
  (setq hledger-jfile
        (expand-file-name "~/.hledger.journal"))
  ;; Expanded account balances in the overall monthly report are
  ;; mostly noise for me and do not convey any meaningful information.
  (setq hledger-show-expanded-report nil)

  :config
  (add-hook 'hledger-view-mode-hook #'hl-line-mode)
  (add-hook 'hledger-mode-hook
            (lambda ()
              (make-local-variable 'company-backends)
              (add-to-list 'company-backends 'hledger-company))))

(use-package hledger-input
  :pin manual
  :load-path "packages/rest/hledger-mode/"
  :bind (("C-c e" . hledger-capture)
         :map hledger-input-mode-map
         ("C-c C-b" . popup-balance-at-point))
  :preface
  (defun popup-balance-at-point ()
    "Show balance for account at point in a popup."
    (interactive)
    (if-let ((account (thing-at-point 'hledger-account)))
        (message (hledger-shell-command-to-string (format " balance -N %s "
                                                          account)))
      (message "No account at point")))

  :config
  (setq hledger-input-buffer-height 20)
  (push 'hledger-company company-backends)
  (add-hook 'hledger-input-post-commit-hook #'hledger-show-new-balances)
  (add-hook 'hledger-input-mode-hook #'auto-fill-mode)
  (add-hook 'hledger-input-mode-hook
            (lambda ()
              (make-local-variable 'company-idle-delay)
              (setq-local company-idle-delay 0.1))))

;; (use-package ledger-mode
;;   :commands ledger-mode
;;   :preface
;;   (defun my-ledger-start-entry (&optional arg)
;;     (interactive "p")
;;     (find-file-other-window "~/Documents/accounting/accounts.ledger")
;;     (goto-char (point-max))
;;     (skip-syntax-backward " ")
;;     (if (looking-at "\n\n")
;;         (goto-char (point-max))
;;       (delete-region (point) (point-max))
;;       (insert ?\n)
;;       (insert ?\n))
;;     (insert (format-time-string "%Y/%m/%d ")))
;;   :init
;;   (setq ledger-clear-whole-transactions 1
;;         ledger-schedule-file "~/Documents/accounting/ledger-schedule.ledger"
;;         ledger-use-iso-dates 1)
;;   :bind ("C-c L" . my-ledger-start-entry)
;;   :mode "\\.ledger\\'")

(use-package flycheck-ledger
  :after (flycheck))

(provide 'init-ledger)

;;; init-ledger.el ends here
