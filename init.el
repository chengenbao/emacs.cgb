;;; package --- Summary:
;;;   Emacs startup init script

;;; Commentary:
;;;   Author: chengenbao
;;;   Email: genbao.chen@gmail.com

;;; Code:

(add-to-list 'load-path "~/.emacs.d/custom")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(require 'setup-packages)
(require 'setup-general)
(require 'setup-theme)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm)
  (require 'setup-helm-gtags))
(require 'setup-cplusplus)
(require 'setup-editing)
(require 'setup-python)

(setq explicit-shell-file-name "/bin/zsh")

;; function-args
(require 'function-args)
(fa-config-default)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-clang-executable "/usr/local/opt/llvm/bin/clang")
 '(flymake-google-cpplint-command "/usr/local/bin/cpplint")
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (lsp-ui company-lsp lsp-mode irony company-c-headers clang-format sr-speedbar function-args zygospore helm-gtags helm yasnippet ws-butler volatile-highlights use-package undo-tree iedit dtrt-indent counsel-projectile company clean-aindent-mode anzu)))
 '(speedbar-use-images nil)
 '(sr-speedbar-right-side nil))

(customize-set-variable 'helm-ff-lynx-style-map t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minibuffer-prompt ((t (:foreground "brightred")))))

(provide 'init)
;;; init.el ends here
