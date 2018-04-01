(use-package yaml-mode
  :ensure t
  :mode "\\.yml\\.erb\\'"
  :hook (yaml-mode . goto-address-prog-mode))

(provide 'init-yaml)
