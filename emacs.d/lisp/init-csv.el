(use-package csv-mode
  :ensure t
  :init
    (setq csv-separators '("," ";" "|" " ")))
(add-auto-mode 'csv-mode "\\.[Cc][Ss][Vv]\\'")
(provide 'init-csv)
