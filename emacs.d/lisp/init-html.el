(use-package tagedit
  :ensure t
  :mode "\\.\\(jsp\\tmpl\\)\\'"
  :config
  (after-load 'sgml-mode
  (tagedit-add-paredit-like-keybindings)
  (add-hook 'sgml-mode-hook (lambda () (tagedit-mode 1)))))

(provide 'init-html)
