;;; Code:
;;; Currently top javascript package for emacs
(use-package js2-mode
  :ensure t
  :mode (("\\.js\\'" . js2-mode)
	 ("\\.pac\\'" . js2-mode))
  :commands js2-mode
  :interpreter "node"
  :config
  (setq mode-name "JS2")
  (js2-imenu-extras-mode t)
  (setq-default
   js2-mode-indent-ignore-first-tab t))

;; JSON support
(use-package json-mode
  :ensure t
  :commands json-mode
  :config
  (bind-keys :map json-mode-map
             ("C-c <tab>" . json-mode-beautify)))
;; Adddinsx
(use-package json-snatcher :ensure t)
(use-package js-doc :ensure t)

(provide 'init-js)
