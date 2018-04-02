;;; init-python.el --- Personal configuration for python -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package virtualenvwrapper)
(use-package pipenv)
(use-package anaconda-mode
  :hook ((python-mode . anaconda-mode)
         (python-mode . anaconda-eldoc-mode)))
(use-package company-anaconda
  :config
  (eval-after-load "company"
    '(add-to-list 'company-backends 'company-anaconda)))
;; (use-package company-jedi
;;   :config
;;   (progn
;;     (defun my/python-mode-hook ()
;;       (add-to-list 'company-backends  'company-jedi))
;;     (add-hook 'python-mode-hook 'my/python-mode-hook)))
(setq flycheck-flake8-maximum-line-length 80)

(provide 'init-python)
;;; init-python.el Ends here
