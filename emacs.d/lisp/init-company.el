;;; Company Mode configuration (Autocomplete)
(use-package company
  :ensure t
  :config
  :hook (after-init . global-company-mode))

(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)

(provide 'init-company)
