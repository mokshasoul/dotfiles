;;; Code:
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;; Steve purcell org settings
;; Various preferences
(setq org-log-done t
      org-refile-targets '((nil :maxlevel . 4)
                           (org-agenda-files :maxlevel . 4))
      org-refile-use-outline-path t
      org-edit-timestamp-down-means-later t
      org-archive-mark-done nil
      org-hide-emphasis-markers t
      org-catch-invisible-edits 'show
      org-export-coding-system 'utf-8
      org-fast-tag-selection-single-key 'expert
      org-html-validation-link nil
      org-export-kill-product-buffer-when-displayed t
      org-tags-column 5
      org-directory '("~/Documents/_org/")
      org-agenda-files '("~/Documents/_org/")
      org-default-notes-file "~/Documents/_org/notes.org")
;; inserts full filename at top of file to link different org files
;; (use-package org-fstree
;;   :ensure t)
;; ****************************************************************
;; GTD Configuration
;; ****************************************************************
(setq org-todo-keywords
  '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "|" "DONE(d)" "CANCELED(c)")))


;; link from clip
(use-package org-cliplink
  :no-require
  :config
  (define-key org-mode-map (kbd "C-c M-l") 'org-cliplink))

;;; Cool Bullets
(use-package org-bullets
  :init
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;;; Set Org-Capture templates
(setq org-capture-templates
      '(("t" "todo" entry
         (file+headline "~/Documents/_org/tasks.org" "Tasks")
         "** TODO %^{Brief description} %^g\n%?\nAdded: %U")
        ("n" "note" entry
         (file+headline "~/Documents/_org/notes.org" "Notes")
         "** :NOTE:\n%U\n%a\n" :clock-keep t)
        ("h" "habit" entry
         (file+headline "~/Documents/_org/tasks.org" "Habits")
         "** TODO %^{Brief description}%^t")))


(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c c") 'org-capture)
(define-key global-map (kbd "C-c a") 'org-agenda)



;; Lots of stuff from http://doc.norang.ca/org-mode.html

;; TODO: fail gracefully
(defun sanityinc/grab-ditaa (url jar-name)
  "Download URL and extract JAR-NAME as `org-ditaa-jar-path'."
  ;; TODO: handle errors
  (message "Grabbing " jar-name " for org.")
  (let ((zip-temp (make-temp-name "emacs-ditaa")))
    (unwind-protect
        (progn
          (when (executable-find "unzip")
            (url-copy-file url zip-temp)
            (shell-command (concat "unzip -p " (shell-quote-argument zip-temp)
                                   " " (shell-quote-argument jar-name) " > "
                                   (shell-quote-argument org-ditaa-jar-path)))))
      (when (file-exists-p zip-temp)
        (delete-file zip-temp)))))

(after-load 'ob-ditaa
  (unless (and (boundp 'org-ditaa-jar-path)
               (file-exists-p org-ditaa-jar-path))
    (let ((jar-name "ditaa0_9.jar")
          (url "http://jaist.dl.sourceforge.net/project/ditaa/ditaa/0.9/ditaa0_9.zip"))
      (setq org-ditaa-jar-path (expand-file-name jar-name (file-name-directory user-init-file)))
      (unless (file-exists-p org-ditaa-jar-path)
        (sanityinc/grab-ditaa url jar-name)))))

(after-load 'ob-plantuml
  (let ((jar-name "plantuml.jar")
        (url "http://jaist.dl.sourceforge.net/project/plantuml/plantuml.jar"))
    (setq org-plantuml-jar-path (expand-file-name jar-name (file-name-directory user-init-file)))
    (unless (file-exists-p org-plantuml-jar-path)
      (url-copy-file url org-plantuml-jar-path))))

;;; integrate projectile todos with org-todos
(use-package org-projectile
  :after (org projectile)
  :bind (("C-c n p" . org-projectile-project-todo-completing-read))
  :config
  (progn
    (setq org-projectile-projects-file
          "~/Documents/_org/projects.org")
    (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
    (push (org-projectile-project-todo-entry) org-capture-templates)))
;; Supercharged agenda
(use-package org-super-agenda
  :disabled t
  ;; :preface
  ;; (defun super-jump-to-org-agenda ()
  ;;   (interactive)
  ;;   (let ((org-super-agenda-groups
  ;;          '((:name "Today"
  ;;                   :time-grid t
  ;;                   :todo "TODAY")
  ;;            (:name "Important"
  ;;                   :tag "bills"
  ;;                   :priority "A")
  ;;            (:order-multi
  ;;             (2 (:name "Shopping in town"
  ;;                       :and (:tag "shopping" :tag "@town"))
  ;;                (:name "Food-related"
  ;;                       :tag ("food" "dinner"))
  ;;                (:name "Personal"
  ;;                       :habit t
  ;;                       :tag "personal")
  ;;                (:name "Space-related (non-moon-or-planet-related)"
  ;;                       :and (:regexp ("space" "NASA")
  ;;                                     :not (:regexp "moon" :tag "planet")))))
  ;;            (:todo "WAITING" :order 8)
  ;;            (:todo ("SOMEDAY" "TO-READ" "CHECK" "TO-WATCH" "WATCHING")
  ;;                   :order 9)
  ;;            (:priority<= "B" :order 1))))
  ;;     (org-agenda nil "a")))
  :config
  (org-super-agenda-mode))
;; Calendar packages for org
(use-package calfw)
(use-package calfw-org
  :after calfw)

(provide 'init-org)
