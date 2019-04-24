(require 'package)
(setq package-archives '(("org"       . "https://orgmode.org/elpa/")
                         ("gnu"       . "https://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(use-package org
  :ensure org-plus-contrib
  :pin org)

(org-babel-load-file
 (expand-file-name "configuration.org" user-emacs-directory))
