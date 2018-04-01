(use-package recentf
  :hook 'after-init-hook 'recentf-mode
  :init
  (setq-default
   recentf-max-saved-items 1000
   recentf-exclue '("/tmp/" "/ssh:")))

(provide 'init-recentf)
