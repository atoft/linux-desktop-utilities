					; .emacs config

;; Uncomment to always refresh packages.
;; (package-refresh-contents)

;; Start maximised
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Save backups to temp directory:
(setq backup-directory-alist
    `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
     `((".*" ,temporary-file-directory t)))

(setq auto-save-default nil)
(setq create-lockfiles nil)

;; Standard copy-paste:
(cua-mode t)

;; Package support
(require 'package)
 
(add-to-list 'package-archives
'("melpa" . "http://melpa.org/packages/") t)
 
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

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
  :hook (after-init . doom-modeline-mode)
  :config (setq doom-modeline-height 32))

(set-face-attribute 'mode-line nil
                    :overline nil
                    :underline nil)

(set-face-attribute 'mode-line-inactive nil
                    :overline nil
                    :underline nil)

;; Highlight the selected line
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
  :after treemacs projectile
  :ensure t)

(global-set-key (kbd "C-x t") #'treemacs)

;; Company mode
(use-package company
  :ensure t)

;; ag search
(use-package ag
  :ensure t)

(use-package ivy
  :ensure t)

;; Dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(setq dashboard-startup-banner 'logo)

(setq dashboard-items '((projects . 5)
                        (recents  . 5)
                        (agenda . 5)))

(setq dashboard-set-footer nil)
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)

;; Wrap long lines on the dashboard
(add-hook 'dashboard-mode-hook #'visual-line-mode)

;; Programming
(setq-default truncate-lines t)
(setq-default column-number-mode t)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(use-package helm
  :ensure t)

(use-package helm-ag
  :ensure t)

;; Zig
(use-package zig-mode
  :ensure t)

;; C++
(setq c-default-style "bsd")
(setq-default c-basic-offset 4)

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

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;; Add breakpoint
(global-set-key (kbd "C-x g b") #'gud-break)

;; Remove breakpoint
(global-set-key (kbd "C-x g r") #'gud-remove)

;; In the gud buffer, interrupt the debugged program
(global-set-key (kbd "C-x g i") #'comint-interrupt-subjob)

;; Continue execution
(global-set-key (kbd "C-x g c") #'gud-cont)

;; Go to inner stack frame
(global-set-key (kbd "C-x g u") #'gud-down)

;; Go to outer stack frame
(global-set-key (kbd "C-x g d") #'gud-up)

;; Start debugging
(global-set-key (kbd "<f5>") #'gdb)

;; Step forward
(global-set-key (kbd "<f6>") #'gud-next)

;; Step in
(global-set-key (kbd "<f7>") #'gud-step)

;; Step out
(global-set-key (kbd "<f8>") #'gud-finish)

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

;; Limit the width of the text in Markdown-mode, similar to the Apostrophe editor.
(use-package visual-fill-column
  :ensure t
  :config
  (setq-default visual-fill-column-center-text t))

(add-hook 'markdown-mode-hook #'visual-fill-column-mode)

;; Org-mode
;; Visual line wrapping
(add-hook 'org-mode-hook #'visual-line-mode)

