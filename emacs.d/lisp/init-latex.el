(use-package auctex
  :mode ("\\.tex\\'" . TeX-latex-mode)
  :hook ((LaTeX-mode . visual-line-mode)
         (LaTeX-mode . LaTeX-math-mode)
         (LaTeX-mode . auto-fill-mode)
         (LaTeX-mode . turn-on-reftex)
         (LaTeX-mode . flyspell-mode))
  :custom
  (custom-set-variables '(LaTeX-command "latex -synctex=1"))
  :init
    (add-hook 'TeX-after-compilation-finished-functions
              #'TeX-revert-document-buffer)

    (setq TeX-view-program-list
          '(("PDF Viewer" "okular --unique %o#src:%n%b")))
    (setq TeX-view-program-selection
          '((output-pdf "PDF Viewer"))))

(provide 'init-latex)
;;; init-latex.el Ends here
