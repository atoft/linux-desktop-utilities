					; .emacs config

;; Save backups to temp directory:
(setq backup-directory-alist
    `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
     `((".*" ,temporary-file-directory t)))

;; Standard copy-paste:
(cua-mode t)

;; Package support
(require 'package)
 
(add-to-list 'package-archives
'("melpa" . "http://melpa.org/packages/") t)
 
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(package-refresh-contents)

;; Themes and visuals
(use-package solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-dark t))

(setq solarized-distinct-fringe-background t)
(setq solarized-high-contrast-mode-line t)

(use-package all-the-icons
  :ensure t)

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

(set-face-attribute 'mode-line nil
                    :overline nil
                    :underline nil)

(set-face-attribute 'mode-line-inactive nil
                    :overline nil
                    :underline nil)

(global-hl-line-mode t)

;; Tree view
(use-package treemacs
  :ensure t)
(use-package treemacs-all-the-icons
  :ensure t
  :config
  (treemacs-load-theme 'all-the-icons))

;; Projects
(use-package projectile
  :ensure t)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "M-p") 'projectile-command-map)

(use-package treemacs-projectile
  :ensure t)

;; Company mode
(use-package company
  :ensure t)

;; C++
(setq c-default-style "bsd")
(setq-default c-basic-offset 4)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; Flycheck (required for LSP)
(use-package flycheck
  :ensure t)

;; LSP mode:
(use-package lsp-mode
  :ensure t
  :config
  ;; Support cross-file rename for C++ in LSP.
  (setq lsp-clients-clangd-args '("-cross-file-rename"))
  (define-key lsp-mode-map (kbd "C-l") lsp-command-map))

(setq lsp-keymap-prefix "C-l")

(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

;;(with-eval-after-load 'lsp-mode
;;  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
;;  (require 'dap-cpptools)
;;  (yas-global-mode))

;; optionally
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)
;; if you are helm user
;;(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
;;(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;;(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
;;(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
;;(use-package which-key
;;    :config
;;    (which-key-mode))


;; Force spaces for TAB
(progn
  (setq-default indent-tabs-mode nil)
)

;; Hide the toolbar
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Refresh buffer if file changes on disk
(global-auto-revert-mode t)

;; Markdown
;; Use visual line wrapping.
(add-hook 'markdown-mode-hook #'visual-line-mode)

;; Org-mode
;; Visual line wrapping
(add-hook 'org-mode-hook #'visual-line-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" default)))
 '(org-agenda-files (quote ("~/Sync/Documents/todo.org")))
 '(package-selected-packages
   (quote
    (treemacs-projectile use-package unicode-fonts treemacs solarized-theme projectile lsp-ui flycheck))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
