;;; Swiper Configuration wiht counsel and ivy
;;; Code:
(use-package swiper
  :ensure try
  :bind (("C-s" . swiper)
         ("C-r" . swiper)
         ("C-c C-r" . ivy-resume)
         ("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq-default
     ivy-use-virtual-buffers t
     ivy-virtual-abbreviate 'fullpath
     ivy-count-format ""
     ivy-magic-tilde nil
     ivy-dynamic-exhibit-delay-ms 150
     magit-completing-read-function 'ivy-completing-read
     enable-recursive-minibuffers t)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> l") 'counsel-find-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))
(use-package ivy-xref
  :ensure t
  :config
  (setq xref-show-xrefs-function 'ivy-xref-show-xrefs))
(provide 'init-ivy)
;;; init-ivy.el Ends here
