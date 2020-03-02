;;; package --- Summary

;;; Commentary:

;;; Code:

(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook ((c-mode . lsp)
         (c++-mode . lsp)
         (python-mode . lsp))
  :config
  (setq lsp-prefer-flymake t)
  )

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :hook (lsp-mode . lsp-ui-mode)
  )

(use-package company-lsp
  :ensure t
  :config
  (push 'company-lsp company-backends)
  ;; Disable client-side cache because the LSP server does a better job.
  (setq company-transformers nil
        company-lsp-async t
        company-lsp-cache-candidates nil)
  )

(use-package clang-format
  :ensure t
  :after cc-mode
  :defines c-mode-base-map
  :bind (:map c-mode-base-map ("C-S-f" . clang-format-region))
  :config
  (use-package sarcasm-clang-format
    :defer t
    :commands sarcasm-clang-format-set-c-style
    :init (add-hook 'c++-mode-hook 'sarcasm-clang-format-set-c-style)))

(use-package company-c-headers
  :config
  (push "/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/include" company-c-headers-path-system)
  (setq company-c-headers-path-user #'company-c-headers-path-user-irony)
  (add-to-list 'company-backends #'company-c-headers))

(provide 'setup-cplusplus)
