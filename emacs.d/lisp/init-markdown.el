(use-package markdown-mode
  :ensure t
  :mode "\\.md\'")
(after-load 'whitespace-cleanup-mode
  (push 'markdown-mode whitespace-cleanup-mode-ignore-modes))
(provide 'init-markdown)
