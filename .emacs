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

; install packages
(use-package dracula-theme :ensure t)
(use-package folding :ensure t)
(use-package markdown-mode :ensure t)
(use-package racket-mode :ensure t)
(use-package graphviz-dot-mode :ensure t)
(use-package multiple-cursors :ensure t)
(use-package project-persist :ensure t)
(use-package project-persist-drawer :ensure t)
(use-package ppd-sr-speedbar :ensure t)

; theme
(setq custom-enabled-themes 'dracula)

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

; racket-mode
(require 'racket-xp)
(add-hook 'racket-mode-hook #'racket-xp-mode)

; auto-save on loss of window focus
(defun save-all ()
  (interactive)
  (save-some-buffers t))
(add-hook 'focus-out-hook 'save-all)

; code folding toggling (hideshow minor mode)
(global-set-key (read-kbd-macro "S-<iso-lefttab>") 'hs-toggle-hiding) ; C-h k <shortcut combo>

; multiple-cursors (Ctrl+D like VSCode/Sublime)
(define-key global-map (kbd "C-d") 'mc/mark-next-like-this)
(define-key global-map (kbd "C-u") 'mc/mark-previous-like-this)

; project-persist + project drawer
(require 'project-persist)
(require 'project-persist-drawer)
(require 'ppd-sr-speedbar)
(project-persist-mode t)
(project-persist-drawer-mode t)
(add-to-list 'project-persist-additional-settings
	     '(my-setting . (lambda () (read-from-minibuffer "My setting: "))))
