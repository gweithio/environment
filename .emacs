;;; package -- Summary

;;; Commentary:

;;; Code:

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(defun dot-emacs ()
  "Opens Emacs config."
  (interactive)
  (find-file "~/.emacs"))

(setq global-display-line-numbers-mode t)

(setq inhibit-startup-screen t)

(setq default-directory "~/Developers")

(toggle-frame-maximized)
(setq tree-sitter-hl-mode t)
(setq tree-sitter-mode t)
;;(setq mode-line-format nil)
(setq x-underline-at-descent-line t)
(setq inhibit-compacting-font-caches t)
(show-paren-mode 1)
;;(menu-bar-mode -1)
;;(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq column-number-mode t)
(set-frame-font "JetBrains Mono")
(set-face-attribute 'default nil :height 200)
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq ns-use-proxy-icon  nil)
(setq frame-title-format nil)
(elcord-mode)

;;(evil-mode)
(which-key-mode)
;;(load-theme 'modus-vivendi)

;;; ---- Misc -----
(electric-pair-mode)
(global-font-lock-mode t)
(global-ligature-mode t)
(transient-mark-mode t)
;;(telephone-line-mode)

;; set keys for Apple keyboard, for emacs in OS X
(setq mac-command-modifier 'super)
(setq mac-option-modifier 'meta) 
(setq mac-control-modifier 'control) ; make Control key do Control
(setq ns-function-modifier 'hyper)  ; make Fn key do Hyper

(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(setq make-backup-files nil)
(setq select-enable-clipboard t)
(setq create-lockfiles nil)
(setq auto-save-default nil)
(defalias 'yes-or-no-p 'y-or-n-p)

(setq-default indent-tabs-mode nil) 
(setq-default tab-width 8)
(setq c-default-style "linux"  c-basic-offset 8)
(setq indent-line-function #'insert-tab)  

;;; ---- Keybinds -----
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x t") 'neotree-toggle)
(global-set-key (kbd "C-x r") 'neotree-refresh)

;;; --- Company ---
(add-hook 'after-init-hook 'global-company-mode)
(setq completion-at-point-functions-saved nil)
(setq tab-always-indent 'complete)
(setq lsp-headerline-breadcrumb-enable nil)

;;(global-company-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("eb02853c4a789d2cd00cc0c6e8e37532690fe70b5fddfc24e259f291048c5ad1" "d77d6ba33442dd3121b44e20af28f1fae8eeda413b2c3d3b9f1315fbda021992" "7c32d87e3f35d93754efca582a250e03a3a4eab13cc2f89239df9e977a47c448" "417b2e4625b6bccb49c6d0714c8d13af1a27f62102ec6d56b538d696fc5ebf19" "5e5771e6ea0c9500aa87e987ace1d9f401585e22a976777b6090a1554f3771c6" "835d934a930142d408a50b27ed371ba3a9c5a30286297743b0d488e94b225c5f" default))
 '(package-selected-packages
   '(evil catppuccin-theme monokai-alt-theme colonoscopy-theme telephone-line naysayer-theme gitlab github-theme tree-sitter-langs tree-sitter clang-format elcord which-key lsp-mode acme-theme neotree linum-off ligature flycheck compat company-php company-go)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
