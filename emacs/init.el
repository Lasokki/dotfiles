;;; package --- Summary
(package-initialize)

;; Melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;; Org
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(require 'org-install)
(require 'ob-tangle)
(require 'web-mode)
(require 'expand-region)
(require 'company)
(require 'company-lsp)
(require 'flycheck)
(require 'editorconfig)
(require 'dockerfile-mode)
(require 'helm-config)
(require 'vue-mode)
(require 'prettier-js)
(require 'nginx-mode)
(require 'xah-css-mode)
(require 'lsp-mode)
(require 'groovy-mode)
(require 'cider)
(require 'which-key)

;;; Code:
(setq load-prefer-newer t)
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(org-babel-load-file (expand-file-name "emacs-init.org"
                                       user-emacs-directory))

;;; Commentary:

;; ## added by OPAM user-setup for Emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
;;(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line

(provide 'init)
;;; init.el ends here
