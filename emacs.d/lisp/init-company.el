;;; Company Mode configuration (Autocomplete)
(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode))
(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)
(provide 'init-company)
