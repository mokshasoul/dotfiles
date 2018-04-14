;;; -*- lexical-binding: t -*-
;;; Code:
(use-package web-mode
  :ensure t
  :mode (("\\.phtml\\'" . web-mode)
  ("\\.tpl\\.php\\'" . web-mode)
  ("\\.[agj]sp\\'" . web-mode)
  ("\\.as[cp]x\\'" . web-mode)
  ("\\.erb\\'" . web-mode)
  ("\\.mustache\\'" . web-mode)
  ("\\.html?\\'" . web-mode)
  ("\\.djhtml?\\'" . web-mode))
  :init
  (setq web-mode-code-indent-offset 2
        web-mode-markupt-indent-offset 2
        web-mode-enable-auto-pairing nil))

;; make web-mode play nice with smartparens taken from
;; prelude
;; (sp-with-modes '(web-mode)
;;   (sp-local-pair "%" "%"
;;                  :unless '(sp-in-string-p)
;;                  :post-handlers '(((lambda (&rest _ignored)
;;                                      (just-one-space)
;;                                      (save-excursion (insert " ")))
;;                                    "SPC" "=" "#")))
;;   (sp-local-tag "%" "<% "  " %>")
;;   (sp-local-tag "=" "<%= " " %>")
;;   (sp-local-tag "#" "<%# " " %>")
;;; EMMET is nice ;)
(use-package emmet-mode
  :requires web-mode
  :hook web-mode
  :init
  (setq emmet-indentation 2))

(provide 'init-web)
