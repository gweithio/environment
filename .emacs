;;; Commentary:

;;; Code:

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))

(package-initialize)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(defun dot-emacs ()
  "Opens Emacs config."
  (interactive)
  (find-file "~/.emacs"))

(setq inhibit-startup-screen t)

(pixel-scroll-mode 1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-basic-offset 4)
(setq c-basic-indent 4)

(global-font-lock-mode t)

(load-theme 'monokai t)

(electric-indent-mode -1)
(setq x-underline-at-descent-line t)
(setq inhibit-compacting-font-caches t)
(show-paren-mode  1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq column-number-mode t)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

(setq auto-save-default nil)

(set-frame-font "JetBrains Mono Nerd Font")

(set-face-bold 'bold t)
(set-face-italic 'font-lock-comment-face nil)
(set-face-bold 'italic nil)
(set-face-italic-p 'italic nil)

(setq frame-resize-pixelwise t)
(add-to-list 'default-frame-alist '(left-fringe . 5))

(set-face-attribute 'default nil :height 180)
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(setq ns-use-proxy-icon  nil)
(setq frame-title-format nil)
(setq mac-pass-command-to-system 't)
(setq x-select-enable-clipboard t)
(global-set-key (kbd "C-x s") 'magit-status)
(global-set-key (kbd "C-x l") 'magit-log-head)
(global-set-key (kbd "C-x c") 'magit-commit-create)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("37c8c2817010e59734fe1f9302a7e6a2b5e8cc648cf6a6cc8b85f3bf17fececf" "4780d7ce6e5491e2c1190082f7fe0f812707fc77455616ab6f8b38e796cbffa9" "7e1b614af1e8e06d5dba84728088ac0dac9dcdc45407edf2bc0ccee0a8a7a9c8" "75fb82e748f32de807b3f9e8c72de801fdaeeb73c791f405d8f73711d0710856" "9cda05ef581a03ce47f9e490c241f659520be02a7318757048db32fef4421da9" "39dd7106e6387e0c45dfce8ed44351078f6acd29a345d8b22e7b8e54ac25bac4" "cc0dbb53a10215b696d391a90de635ba1699072745bf653b53774706999208e3" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default))
 '(package-selected-packages
   '(erlang magit monokai-theme haskell-tng-mode haskell-emacs haskell-mode tok-theme rescript-mode catppuccin-theme tuareg sorcery-theme monochrome-theme minimal-theme color-theme-sanityinc-tomorrow)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
