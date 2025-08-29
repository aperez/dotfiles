(setq gc-cons-threshold 50000000)

(setq byte-compile-warnings '(not obsolete))
(setq warning-suppress-log-types '((comp) (bytecomp)))
(setq native-comp-async-report-warnings-errors 'silent)

(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

(setq frame-resize-pixelwise t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode 0)
