;;; Code:
(use-package magit
  :ensure t
  :bind* (("<f8>" . magit-blame)
          ("C-x g" . magit-status))
  :commands (magit-status
             magit-blame
             magit-checkout
             magit-og-buffer))
;; Timemachine
(use-package git-timemachine :ensure t)
;; Snippets from gist
(use-package yagist :ensure t)
(use-package magit-gh-pulls
  :hook (magit-mode-hook . turn-on-magit-gh-pulls))

(provide 'init-git)
;;; init-git.el Ends here
