;; Increase GC threshold
(setq gc-cons-threshold 50000000)

;; Reduce warnings
(setq byte-compile-warnings '(not obsolete))
(setq warning-suppress-log-types '((comp) (bytecomp)))
(setq native-comp-async-report-warnings-errors 'silent)

;; No initial startup screen
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; Hide the menu, toolbar, scrollbar
(setq frame-resize-pixelwise t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode 0)

;; Save emacs customizations in a separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
