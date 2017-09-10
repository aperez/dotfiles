(tool-bar-mode 0)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(add-to-list 'default-frame-alist '(font . "Source Code Pro-14"))

(require 'server)
(unless (server-running-p) (server-start))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(require 'package)
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package org
  :ensure org-plus-contrib
  :pin org)

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package base16-theme
  :ensure t
  :config (load-theme 'base16-default-dark t))
(custom-theme-set-faces
  'base16-default-dark
  `(linum ((t (:background ,(plist-get base16-default-dark-colors :base00)
                           :foreground ,(plist-get base16-default-dark-colors :base02)))))
  `(fringe ((t (:background ,(plist-get base16-default-dark-colors :base01))))))
;(setq-default left-fringe-width 4)

(use-package fish-mode
  :ensure t)

(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq c-basic-offset 4)

(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

(setq-default fill-column 80)
(setq-default word-wrap t)

(global-linum-mode 1)
(set-face-attribute 'linum nil :height 125)

(setq org-startup-truncated nil)
(eval-after-load "org"
  '(progn
     (delete '("\\.pdf\\'" . default) org-file-apps)
     (add-to-list 'org-file-apps '("\\.pdf::\\([0-9]+\\)\\'" . "zathura --fork \"%s\" -P %1"))
     (add-to-list 'org-file-apps '("\\.pdf\\'" . "zathura --fork %s"))))
(setq org-link-file-path-type 'adaptive)

(setq local-file (expand-file-name "local.el" user-emacs-directory))
(when (file-exists-p local-file)
  (load local-file))
