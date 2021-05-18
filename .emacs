; make sure this file is not written to by the customize interface
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

; package manager: melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

; package manager: use-package (install, if not yet installed)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))

; package manager: keep packages updated automatically
;(unless (package-installed-p 'auto-package-update)
;  (package-refresh-contents)
;  (package-install 'auto-package-update))
;(eval-when-compile (require 'auto-package-update))
;(use-package auto-package-update
;  :config
;  (setq auto-package-update-delete-old-versions t)
;  (setq auto-package-update-hide-results t)
;  (auto-package-update-maybe))

; install language modes
(use-package markdown-mode :ensure t)
(use-package graphviz-dot-mode :ensure t)
(use-package racket-mode :ensure t)

; theme
(load-theme 'dracula t)

; hide toolbar
(tool-bar-mode 0)

; maximise window on start
(add-to-list 'default-frame-alist '(fullscreen . maximized))

; start with empty *scratch* buffer
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")

; enable cut/ctrl+x copy/ctrl+c paste/ctrl+v
(cua-mode)

; disable automatic backup~ file creation
(setq make-backup-files nil)

; scroll line by line
(setq scroll-step           1
      scroll-conservatively 10000)

; highlight matching parentheses
(show-paren-mode 1)

; racket via lsp
; $ raco pkg install racket-langserver
(use-package lsp-mode
  :ensure t
  :init (setq lsp-keymap-prefix "C-l")
  :hook ((racket-mode . lsp))
  :commands lsp)
(use-package lsp-ui :commands lsp-ui-mode :ensure t)
;(require 'lsp-mode)
(require 'lsp-racket)
(add-hook 'racket-mode-hook #'lsp-racket-enable)

; racket-xp
(require 'racket-xp)
(add-hook 'racket-mode-hook #'racket-xp-mode)

; auto-save on loss of window focus
(defun save-all ()
  (interactive)
  (save-some-buffers t))
(add-hook 'focus-out-hook 'save-all)

; code folding toggling (hideshow minor mode)
(use-package folding :ensure t)
(global-set-key (read-kbd-macro "S-<iso-lefttab>") 'hs-toggle-hiding) ; C-h k <shortcut combo>

; multiple-cursors (Ctrl+D like VSCode/Sublime)
(use-package multiple-cursors :ensure t)
(define-key global-map (kbd "C-d") 'mc/mark-next-like-this)
(define-key global-map (kbd "C-u") 'mc/mark-previous-like-this)

; project-persist + project drawer (toggle: M-x p-op RET)
(use-package project-persist :ensure t)
(use-package project-persist-drawer :ensure t)
(use-package ppd-sr-speedbar :ensure t)
(require 'project-persist)
(require 'project-persist-drawer)
(require 'ppd-sr-speedbar)
(project-persist-mode t)
(project-persist-drawer-mode t)
(add-to-list 'project-persist-additional-settings
	     '(my-setting . (lambda () (read-from-minibuffer "My setting: "))))
(setq default-directory "~/Source/")
;(project-persist-drawer-open)
