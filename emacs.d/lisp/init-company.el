;;; Company Mode configuration (Autocomplete)
(setq tab-always-indent 'complete)

(use-package company
  :config
  (setq company-idle-delay 0
        company-minimum-prefix-length 3)
  (global-company-mode t))

(add-to-list 'completion-styles 'initials t)

(use-package company-jedi
  :config
  (progn
    (defun my/python-mode-hook ()
      (add-to-list 'company-backends  'company-jedi))
    (add-hook 'python-mode-hook 'my/python-mode-hook)))

(use-package company-auctex
  :after (company latex))
(use-package company-php
  :after (company php))
(provide 'init-company)
