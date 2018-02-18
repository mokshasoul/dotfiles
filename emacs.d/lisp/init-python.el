(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  )
(use-package jedi
  :ensure t)
(use-package company-jedi
  :ensure t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Django-Mode turned of cz you know tryin stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package django-html-mode
;;   :ensure t
;;   :init
;;     (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . django-html-mode)))
;; (use-package django-mode
;;   :ensure t)
;; (yas/load-directory "~/.emacs.d/lisp/django-mode/snippets/")
(provide 'init-python)
