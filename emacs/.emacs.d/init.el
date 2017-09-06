(tool-bar-mode 0)
(scroll-bar-mode -1)
(set-frame-font "Source Code Pro 13" nil t)

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

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package base16-theme
  :ensure t
  :config (load-theme 'base16-default-dark t))

(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq c-basic-offset 4)

(setq local-file (expand-file-name "local.el" user-emacs-directory))
(when (file-exists-p local-file)
  (load local-file))
