;;; init --- Summary
;;; Commentary:
;;; Code:
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

(use-package wgrep)
(use-package diminish)
(use-package scratch)
(use-package command-log-mode)
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
(require 'init-projectile)
(require 'init-recentf)

;; (require 'init-smex) we use swiper and ivy
;; Org mode
(require 'init-org)
(require 'init-sessions)
(require 'init-editing-utils)
(require 'init-flyspell)
;;; CSV Mode settings
(require 'init-csv)
;;; Languages
(require 'init-python)
(require 'init-php)
(require 'init-latex)
;;; Devops Stuffnn
(require 'init-ansible)
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
(require 'init-git)
;; YAML, Markdown and latex support
(require 'init-yaml)
(require 'init-markdown)

;; Misc
(require 'init-docker)
(require 'init-docmodes)
(require 'init-sys-utils)
(require 'init-misc)
;; Extra packages which don't require any configuration purcell
(use-package gnuplot)
(use-package lua-mode)
(use-package htmlize)
(use-package dsvn)
(use-package try) ;; test install packages
(use-package ggtags)
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
;;----------------------------------------------------------------------------
;; Personal settings
;;----------------------------------------------------------------------------
(require 'init-personal)
(provide 'init)
;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init.el ends here
