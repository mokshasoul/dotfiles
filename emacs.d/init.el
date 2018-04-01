;;----------------------------------------------------------------------------
;; Adjust garbage collection thresholds during startup, and thereafter
;;----------------------------------------------------------------------------
(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'after-init-hook
            (lambda () (setq gc-cons-threshold (* 20 1024 1024)))))
;;; Follow simlinks to git controlled files
(setq vc-follow-symlinks t)
;;; Add lisp folder to path in order to load the init files  
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking)
;;----------------------------------------------------------------------------
;; Bootstrap config (taken from purcell)
;;----------------------------------------------------------------------------
;; Offload custom file which gets autowritten by package
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
;; Calls (package-initialize)
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-exec-path) ;; Set up $PATH

(use-package wgrep :ensure t)
(use-package diminish :ensure t)
(use-package scratch :ensure t)
(use-package command-log-mode :ensure t)
;; Configure interface
(require 'init-theme)
(require 'init-gui-frames)
(require 'init-windows)
;; Better dired configuration, taken from purcell
(require 'init-dired)
(require 'init-grep)
;; Make unique buffer names
(require 'init-uniquify)
;; (require 'init-ibuffer)
;; Autocompletion, syntax checkers and expanders
(require 'init-flycheck)
(require 'init-ivy)
(require 'init-hippie-expand)
(require 'init-company)
;;; Require projectmanagement
(require 'init-recentf)

;; (require 'init-smex) we use swiper and 

(require 'init-sessions)
(require 'init-editing-utils)
;;; CSV Mode settings
(require 'init-csv)
;;; WebDev Stuff
(require 'init-web)
(require 'init-css)
(require 'init-js)
;;; Paredit
(require 'init-paredit)
(require 'init-html)
;;; Untils
(require 'init-editing-utils)
(require 'init-whitespace)
(require 'init-yasnippet)
;; YAML, Markdown and latex support
(require 'init-yaml)
(require 'init-markdown)

;; Extra packages which don't require any configuration purcell
(use-package gnuplot :ensure t)
(use-package lua-mode :ensure t)
(use-package htmlize :ensure t)
(use-package dsvn :ensure t)
;; WTF
(global-linum-mode t)
;; Remaps
(global-set-key [remap list-buffers] #'buffer-menu)

;;; QoS packages
;;; Try Configuration
(use-package try
  :ensure t)

;; Avy per character navigation


(progn
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))
  (setq-default save-place-mode 1)
  (setq save-interprogram-paste-before-kill t
        require-final-newline t
        apropos-do-all t
        visible-bell t
        load-prefer-newer t

        save-place-file (concat user-emacs-directory "places")
        backup-directory-alist `(("." . ,(concat user-emacs-directory
						 "backups")))))




(setq auto-mode-alist
      (append
       (list
        '("\\.\\(vcf\\|gpg\\)$" . sensitive-minor-mode)
        )
       auto-mode-alist))

;; (defvar --backup-directory (concat user-emacs-directory "backups"))
;; (if (not (file-exists-p --backup-directory))
;;        (make-directory --backup-directory t))
(use-package ggtags
  :ensure t
  )

;;; `server' for emacs
(require 'server)
(if (not (eq system-type 'windows-nt))
           (unless (server-running-p)
             (server-start)))
;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(when (file-exists-p custom-file)
  (load custom-file))

;;----------------------------------------------------------------------------
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------
(require 'init-locales)

(provide 'init)
;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
