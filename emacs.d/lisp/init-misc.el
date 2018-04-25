;;; Code:

;;----------------------------------------------------------------------------
;; Misc config - yet to be placed in separate files
;;----------------------------------------------------------------------------
(add-auto-mode 'tcl-mode "^Portfile\\'")
(fset 'yes-or-no-p 'y-or-n-p)

(add-hook 'prog-mode-hook 'goto-address-prog-mode)

(use-package regex-tool
  :config
  (setq-default regex-tool-backend 'perl))

(use-package dotenv-mode
  :ensure t
  :mode "\\.env\\..*\\'")

(setq browse-url-browser-function 'browse-url-xdg-open)

(setq auto-mode-alist
      (append
       (list
        '("\\.\\(vcf\\|gpg\\)$" . sensitive-minor-mode)
        )
       auto-mode-alist))
(progn
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))
  (setq-default save-place-mode 1)
  (setq save-interprogram-paste-before-kill t
        require-final-newline t
        apropos-do-all t
        visible-bell t
        load-prefer-newer t

        save-place-file (concat user-emacs-directory "places")
        backup-directory-alist `(("." . ,(concat user-emacs-directory
						 "backups")))))
;;; Faster than default
(setq tramp-default-method "ssh")
;;; Default is org
(setq-default major-mode 'org-mode)
;;; Backup and autosave to temp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
;;; CruX
(use-package crux)
(provide 'init-misc)
;;; init-misc.el Ends here
