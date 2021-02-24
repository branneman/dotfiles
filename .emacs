; enable cut/ctrl+x copy/ctrl+c paste/ctrl+v
(cua-mode)

; disable automatic backup~ file creation
(setq make-backup-files nil)

; auto-save on loss of window focus
(defun save-all ()
  (interactive)
  (save-some-buffers t))
(add-hook 'focus-out-hook 'save-all)

; scroll line by line
(setq scroll-step            1
      scroll-conservatively  10000)

; highlight matching parentheses
(show-paren-mode 1)

; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

; racket-mode
(require 'racket-xp)
(add-hook 'racket-mode-hook #'racket-xp-mode)

(custom-set-variables
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("81c3de64d684e23455236abde277cda4b66509ef2c28f66e059aa925b8b12534" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (racket-mode markdown-mode folding graphviz-dot-mode dracula-theme))))
(custom-set-faces)

; racket-mode
(require 'racket-xp)
(add-hook 'racket-mode-hook #'racket-xp-mode)
