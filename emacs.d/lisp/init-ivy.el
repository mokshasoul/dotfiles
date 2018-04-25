;;; Swiper Configuration wiht counsel and ivy
;;; Code:
(use-package ivy
  :diminish
  :bind (("C-x b" . ivy-switch-buffer)
         ("C-c C-r" . ivy-resume)
         ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  (ivy-dynamic-exhibit-delay-ms 200)
  (ivy-height 10)
  (ivy-initial-input-alist nil t)
  (ivy-use-virtual-buffers t)
  (ivy-magic-tilde nil)
  (ivy-virtual-abbreviate 'fullpath)
    (ivy-count-format "")
  :config
  (ivy-mode 1)
  (ivy-set-occur 'ivy-switch-buffer 'ivy-switch-buffer-occur))
(use-package counsel
  :after ivy
  :diminish
  :bind (
         ("C-*" . counsel-org-agenda-headlines)
         ("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-x C-f" . counsel-find-file))
  :commands counsel-minibuffer-history
  :custom
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (define-key read-expression-map (kbd "C-r") 'counsel-expression-history))

;; (use-package counsel-tramp
;;   :commands counsel-tramp)

(use-package swiper
  :bind (("C-s" . swiper)
         ("C-r" . swiper))
  :config
  (progn
    (setq-default
     magit-completing-read-function 'ivy-completing-read
     enable-recursive-minibuffers t)))

(use-package ivy-xref
  :config
  (setq xref-show-xrefs-function 'ivy-xref-show-xrefs))


(provide 'init-ivy)
;;; init-ivy.el Ends here
