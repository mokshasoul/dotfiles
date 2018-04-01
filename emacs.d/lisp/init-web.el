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
	 ("\\.html?\\'" . web-mode))
  :init
  (setq web-mode-code-indent-offset 2
        web-mode-markupt-indent-offset 2))
;;; EMMET is nice ;)
(use-package emmet-mode
  :ensure web-mode
  :hook 'web-mode-hook 'emmet-mode
  :init
  (setq emmet-indentation 2))

(provide 'init-web)
