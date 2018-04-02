;;; Company Mode configuration (Autocomplete)
(use-package company
  :config
  (setq company-idle-delay 0
        company-minimum-prefix-length 3)
  (global-company-mode t))
(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)
(use-package company-jedi
  :config
  (progn
    (defun my/python-mode-hook ()
      (add-to-list 'company-backends  'company-jedi))
    (add-hook 'python-mode-hook 'my/python-mode-hook)))
(provide 'init-company)
