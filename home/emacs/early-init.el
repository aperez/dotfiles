;;; -*- lexical-binding: t -*-

(setq inhibit-startup-screen t
      initial-scratch-message nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(push '(font . "JetBrains Mono-15") default-frame-alist)
(push '(background-color . "#181818") default-frame-alist)
(push '(foreground-color . "#d8d8d8") default-frame-alist)

(load (expand-file-name (concat (system-name) "-early") user-emacs-directory) t)
