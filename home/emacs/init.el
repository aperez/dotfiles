;;; -*- lexical-binding: t -*-

(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(load-theme 'base16-default-dark t)

(load (expand-file-name (system-name) user-emacs-directory) t)

(envrc-global-mode)
