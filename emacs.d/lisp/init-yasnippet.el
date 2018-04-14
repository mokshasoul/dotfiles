;;; Code:
(use-package yasnippet
  :after prog-mode
  :defer 10
  :diminish yas-minor-mode
  :init
  (add-hook 'after-init-hook 'yas-global-mode)
  (add-hook 'term-mode-hook #'force-yasnippet-off)
  (add-hook 'shell-mode-hook #'force-yasnippet-off)
  :config
  (yas-global-mode 1)
  ;; (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  ;; (setq yas-snippet-dirs '("~/.emacs.d/lisp/yasnippet/snippets"))
  (yas-reload-all))
(use-package yasnippet-snippets
  :ensure t)
;; (add-to-list 'load-path
;;              "~/.emacs.d/plugins/yasnippet")
(defun force-yasnippet-off ()
  (setq-local yas-dont-activate t)
  (yas-minor-mode 1))

(provide 'init-yasnippet)
;;; init-yasnippet.el Ends here
