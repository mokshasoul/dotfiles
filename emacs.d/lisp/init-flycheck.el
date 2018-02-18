(use-package flycheck
  :ensure t
  :hook 'after-init-hook 'global-flycheck-mode
  :init
  (setq flycheck-display-errors-function
        #'flycheck-display-error-messages-unless-error-list))
(use-package flycheck-color-mode-line
  :ensure t
  :hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)
(provide 'init-flycheck)
