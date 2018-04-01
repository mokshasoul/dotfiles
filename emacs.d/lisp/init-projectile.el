;; Project management
;;; Code:
(use-package projectile
             :ensure t
             :hook 'after-init-hook 'projectile-mode
             :config
             (setq projectile-completion-system 'ivy
		   projectile-enable-caching nil))
;; Projectile support for counsel
(use-package counsel-projectile
  :ensure t
  :hook 'projectile-mode-hook 'counsel-projectile-mode)
(provide 'init-projectile);;; init-projectile.el ends here
