;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq display-line-numbers-type 'relative)

(setq org-directory "~/org/")

 (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
 (load-theme 'dracula t)

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword :slant italic))
