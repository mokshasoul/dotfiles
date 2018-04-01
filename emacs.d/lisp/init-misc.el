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

(provide 'init-misc)
;;; init-misc.el Ends here
