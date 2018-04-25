;;; Code:
(use-package sass-mode
  :ensure t
  :mode "\\.sass\\.erb"
  :init
  (setq css-indent-offset 2))
(use-package scss-mode
  :ensure t
  :mode "\\.scss"
  :init
  (setq-default scss-compile-at-save nil))
;; Install SASS-Mode, assign to extensions, set indent on init
(provide 'init-css)
;;; init-css.el Ends here
