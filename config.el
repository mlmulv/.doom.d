;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq exec-path (append exec-path '("C:\\msys64\\mingw64\\bin")))
(setenv "PATH" (concat "C:\\msys64\\mingw64\\bin;" (getenv "PATH")))

(setq display-line-numbers-type 'relative)

(setq org-directory "~/org/")

 (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
 (load-theme 'dracula t)

(add-to-list 'load-path "~/.emacs.d/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(add-to-list 'load-path "~/.emacs.d/org-bullets")
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword :slant italic))

(use-package lsp-mode
:commands (lsp lsp-deferred)
:init
(setq lsp-keymap-prefix "C-c l") ;; Control l for lsp-mode
:config
(lsp-enable-which-key-integration t)) ;; descriptions for key bindings

(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind (:map company-active-map
         ("<tab>" . company-complete-selection))
        (:map lsp-mode-map
         ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package company-box
  :hook (company-mode . company-box-mode))
