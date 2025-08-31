;; Package sourcing
(setq package-archives '(("org"       . "https://orgmode.org/elpa/")
                         ("gnu"       . "https://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")))

;; Turn on syntax highlighting when available
(global-font-lock-mode t)

;; Spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq-default c-basic-offset 4)
(c-set-offset 'innamespace 0)

;; Show line numbers next to the left fringe
(global-display-line-numbers-mode)

;; Highlight cursor line
(global-hl-line-mode t)

;; Line wrapping
(setq-default fill-column 80)
(setq-default word-wrap t)

;; Trailing whitespace
(setq require-final-newline t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; y/n to confirm commands
(fset 'yes-or-no-p 'y-or-n-p)

;; File handling, follow symlinks, refresh buffer upon changes
(setq vc-follow-symlinks t)
(global-auto-revert-mode t)

;; Stop creating backup files
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

;; Theming
(add-to-list 'default-frame-alist '(font . "Source Code Pro-14"))

(use-package base16-theme
  :ensure t
  :config (load-theme 'base16-default-dark t))

(use-package powerline
  :ensure t
  :config (powerline-default-theme)
  :init
  (setq powerline-default-separator 'zigzag))

;; Packages
(use-package delight
  :ensure t)

(use-package which-key
  :ensure t
  :delight
  :config (which-key-mode))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package counsel
  :ensure t
  :bind ("M-x" . counsel-M-x))

(use-package projectile
  :ensure t
  :delight '(:eval (concat " P[" (projectile-project-name) "]"))
  :config (projectile-mode +1)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap ("M-p" . projectile-command-map))

(use-package popwin
  :ensure t
  :config (popwin-mode t))
