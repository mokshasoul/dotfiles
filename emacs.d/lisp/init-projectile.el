;; Project management
;;; Code:
(use-package projectile
             :ensure t
             :hook 'after-init-hook 'projectile-mode
             :init
             (setq projectile-completion-system 'ivy)
             (setq projectile-enable-caching nil))
(provide 'init-projectile);;; init-projectile.el ends here
