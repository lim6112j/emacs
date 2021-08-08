(menu-bar-mode 0)
(tool-bar-mode 0)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tango-dark))
 '(haskell-mode-hook '(interactive-haskell-mode))
 '(initial-frame-alist '((fullscreen . maximized)))
 '(package-selected-packages
   '(treemacs-projectile treemacs projectile magit company-ghci haskell-snippets flycheck-haskell exec-path-from-shell lsp-haskell haskell-mode evil multiple-cursors mark-multiple smex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#2e3436" :foreground "#eeeeec" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 180 :width normal :foundry "nil" :family "Menlo")))))
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
;;(require 'smex) ; Not needed if you use package.el
;;(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                    ; when Smex is auto-initialized on its first run.
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;;(global-set-key (kbd "C-.") #'other-window)
(global-set-key (kbd "C-,") #'prev-window)

(defun prev-window ()
  (interactive)
  (other-window -1))
(add-to-list 'load-path "~/.emacs.d/lisp")
;;(load "ghcid.el")
;;(require 'ghcid)
(cd "~")
(global-display-line-numbers-mode)
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(put 'upcase-region 'disabled nil)
(global-set-key (kbd "M-o") (lambda () (interactive)(end-of-line)(newline)))
(add-to-list 'load-path "~/.emacs.d/elpa/evil-1.14.0")
(require 'evil)
(evil-mode 1)
(ido-mode 1)
(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-literate-mode-hook #'lsp)
;;(add-to-list 'exec-path "~/.ghcup/bin/")
;;(add-to-list 'exec-path "~/.local/bin/")
(projectile-mode +1)
;; for mac
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;;(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(set-face-attribute 'comint-highlight-prompt nil
                    :inherit nil)
