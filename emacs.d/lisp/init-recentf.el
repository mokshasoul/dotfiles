(use-package recentf
  :hook (after-init . recentf-mode)
  :init
  (setq-default
   recentf-max-saved-items 40
   recentf-exclude '("/tmp/" "/ssh:")))

(provide 'init-recentf)
