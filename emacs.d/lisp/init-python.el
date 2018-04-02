;;; init-python.el --- Personal configuration for python -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package elpy
  :config
  (elpy-enable))
(use-package virtualenvwrapper
  :config
  (venv-initialize-interactive-shells)
  (venv-initialize-eshell))
(use-package pipenv)

(setq flycheck-flake8-maximum-line-length 80)

(provide 'init-python)
;;; init-python.el Ends here
