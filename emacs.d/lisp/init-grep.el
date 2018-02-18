(setq-default grep-highlight-matches t
              grep-scroll-output t)
(when (and (executable-find "ag")
           (use-package ag :ensure t))
  (use-package wgrep-ag)
  :ensure t
  :init
  setq-default ag-highlight-search t)

(provide 'init-grep)
