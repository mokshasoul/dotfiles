;;; Code:
(use-package flycheck
  :hook (prog-mode . global-flycheck-mode)
  :init
  (setq flycheck-display-errors-function
        #'flycheck-display-error-messages-unless-error-list))
(use-package flycheck-color-mode-line
  :ensure t
  :hook (flycheck-mode . flycheck-color-mode-line-mode))

(provide 'init-flycheck)
;;; init-flycheck.el Ends here
