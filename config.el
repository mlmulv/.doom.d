;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq exec-path (append exec-path '("C:\\msys64\\mingw64\\bin")))
(setenv "PATH" (concat "C:\\msys64\\mingw64\\bin;" (getenv "PATH")))

(setq org-directory "~/org/")

(setq display-line-numbers-type 'relative)

 (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
 (load-theme 'dracula t)

(add-to-list 'load-path "~/.emacs.d/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(add-to-list 'load-path "~/.emacs.d/org-superstar")
(require 'org-superstar)

;;; Titles and Sections
;; hide #+TITLE:
(setq org-hidden-keywords '(title))
;; set basic title font
(set-face-attribute 'org-level-8 nil :weight 'bold :inherit 'default)
;; Low levels are unimportant => no scaling
(set-face-attribute 'org-level-7 nil :inherit 'org-level-8)
(set-face-attribute 'org-level-6 nil :inherit 'org-level-8)
(set-face-attribute 'org-level-5 nil :inherit 'org-level-8)
(set-face-attribute 'org-level-4 nil :inherit 'org-level-8)
;; Top ones get scaled the same as in LaTeX (\large, \Large, \LARGE)
(set-face-attribute 'org-level-3 nil :inherit 'org-level-8 :height 1.2) ;\large
(set-face-attribute 'org-level-2 nil :inherit 'org-level-8 :height 1.44) ;\Large
(set-face-attribute 'org-level-1 nil :inherit 'org-level-8 :height 1.728) ;\LARGE
;; Only use the first 4 styles and do not cycle.
(setq org-cycle-level-faces nil)
(setq org-n-level-faces 4)
;; Document Title, (\huge)
(set-face-attribute 'org-document-title nil
                    :height 2.074
                    :foreground 'unspecified
                    :inherit 'org-level-8)

;;; Basic Setup
;; Auto-start Superstar with Org
(add-hook 'org-mode-hook
          (lambda ()
            (org-superstar-mode 1)))

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword :slant italic))

(use-package org-autolist
  :hook (org-mode . org-autolist-mode))

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
