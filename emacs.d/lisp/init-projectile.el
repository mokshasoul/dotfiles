;; Project management
;;; Code:
(use-package projectile
             :ensure t
             :hook 'after-init-hook 'projectile-mode
             :init
             (setq projectile-completion-system 'ivy)
             (setq projectile-enable-caching nil)
             :config
             ;; Shorter modeline
             (setq-default
              projectile-mode-line
              '(:eval
                (if (file-remote-p default-directory)
                    " Proj"
                  (format " Proj[%s]" (projectile-project-name))))))

(provide 'init-projectile);;; init-projectile.el ends here
