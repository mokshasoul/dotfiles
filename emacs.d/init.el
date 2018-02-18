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

(require 'init-theme)
(require 'init-gui-frames)
(require 'init-dired)
(require 'init-grep)
(require 'init-uniquify)
(require 'init-ibuffer)
(require 'init-flycheck)

(require 'init-recentf)
;; (require 'init-smex) we use swiper and counsel
(require 'init-ivy)
(require 'init-hippie-expand)
(require 'init-windows)
(require 'init-sessions)
(require 'init-editing-utils)
;;; CSV Mode settings
(require 'init-csv)
;;; CSS Stuff and preprocessors
(require 'init-css)
;;; Paredit
(require 'init-paredit)
;;; Dired settings taken from purcell config
(require 'init-dired)
(require 'init-html)
(require 'init-editing-utils)
(require 'init-whitespace)

;; Manage projects (e.g. gits and stuff)
(require 'init-projectile)

(require 'init-yaml)
(require 'init-markdown)

;; Extra packages which don't require any configuration purcell

(use-package gnuplot :ensure t)
(use-package lua-mode :ensure t)
(use-package htmlize :ensure t)
(use-package dsvn :ensure t)
(use-package regex-tool :ensure t)
(use-package dotenv-mode
  :ensure t
  :mode "\\.env\\..*\\'")
;;----------------------------------------------------------------------------
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------


;;; QoL
;;; visual line wrap
(visual-line-mode t)
(global-visual-line-mode t)
;;; Enable primary clipboard
(setq x-select-enable-clipboard t)
;;; Tramp
(setq tramp-default-method "ssh")
;;; Remember what was open
(desktop-save-mode 1)
(defalias 'yes-or-no 'y-or-n-p)
;;; Disable Scratch mode
(setq initial-scratch-message "")
(setq initial-major-mode 'emacs-lisp-mode)
;;; Enable notes as major mode
(setq remember-notes-initial-major-mode 'org-mode)
(setq initial-buffer-choice 'remember-notes)
;;; Disable C-cC-c to only enable org-keybind
(with-eval-after-load 'remember
  (define-key remember-notes-mode-map (kbd "C-c C-c") nil))
;;; Shorten yes/no answers
(fset 'yes-or-no-p 'y-or-n-p)
;;; Set XDG-Open
(setq browse-url-browser-function 'browse-url-xdg-open)
;;; Set CUA-Mode
(cua-mode 1)
(setq cua-auto-tabify-rectangles nil) ;; on't tabify after rectangle command
(transient-mark-mode 1) ;; no region when it is not highlighted
(setq cua-keep-region-after-copy nil) ;; standard windows behavior


;; 
;; 
;; WTF
(global-linum-mode t)
;; Remaps
(global-set-key [remap list-buffers] #'buffer-menu)


;;; Calendar Application that is cool
(use-package calfw
  :ensure t)



;;; QoS packages
;;; Try Configuration
(use-package try
  :ensure t)


;;; Counsel Configuration
(use-package counsel
  :ensure t
  )
;;; Company Mode configuration (Autocomplete)
(use-package company
  :ensure t
  :config
  (progn
    ))
(add-hook 'after-init-hook 'global-company-mode)
;; Avy per character navigation
(use-package avy
  :ensure t
  :commands avy-goto-word-1
  :bind ("M-s" . avy-goto-word-1))

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
;;; Minor Modes for config files
(use-package i3wm
  :ensure t)

(use-package systemd
  :ensure t)


;;; Web Dev with Emacs
(use-package web-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (setq web-mode-code-indent-offset 2
        web-mode-markupt-indent-offset 2))
(use-package emmet-mode
  :ensure t
  :init
  (add-hook 'web-mode-hook 'emmet-mode)
  (setq emmet-indentation 2))
;; JS-etc
(use-package json-mode :ensure t)
(use-package json-snatcher :ensure t)
(use-package js-doc :ensure t)

;;; yasnippet
;; Also add all directories within "lisp"
(add-to-list 'load-path
             "~/.emacs.d/plugins/yasnippet")
(use-package yasnippet
  :ensure t
  :init
  (add-hook 'after-init-hook 'yas-global-mode)
  (add-hook 'term-mode-hook #'force-yasnippet-off)
  (add-hook 'shell-mode-hook #'force-yasnippet-off)
  :config
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  (setq yas-snippet-dirs '("~/.emacs.d/lisp/yasnippet/snippets"))
  (yas-reload-all)
  )
(defun force-yasnippet-off ()
  (setq-local yas-dont-activate t)
  (yas-minor-mode 1))


;; Magit
(use-package git-timemachine :ensure t)
(use-package yagist :ensure t)

(use-package magit
  :ensure t
  :bind* (("<f8>" . magit-blame)
          ("<f1>" . magit-status))
  :commands (magit-status
             magit-blame
             magit-checkout
             magit-og-buffer))

(use-package magit-gh-pulls
  :ensure t
  :init
  (add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls))

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
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\.md" . markdown-mode) auto-mode-alist))


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
