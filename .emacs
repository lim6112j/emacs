(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(setq visible-bell t)
(load-theme 'wombat)
(require 'package)
(set-face-attribute 'default nil :height 200)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)
(use-package command-log-mode)
(when (eq system-type 'darwin)
  (setq
   ns-command-modifier 'super
   ns-option-modifier 'meta
   ns-function-modifier 'hyper))
(use-package which-key)
(require 'which-key)
(which-key-mode 1)
(use-package swiper :ensure t)
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)
(unless (package-installed-p 'evil-leader)
  (package-install 'evil-leader))
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "w" 'evil-window-map
  "d" 'dired
  "p" 'projectile-command-map
  "f f" 'find-file
  "f s" 'save-buffer
  "b b" 'ivy-switch-buffer
  "," 'ivy-switch-buffer
  "t f" 'treemacs-create-file
  "t d" 'treemacs-create-dir
  "c c" 'lsp-execute-code-action
  "c f" 'lsp-format-buffer
  "q q" 'save-buffers-kill-emacs
  "e" 'eval-region
  ":" 'execute-extended-command
  "s" 'shell)

(unless (package-installed-p 'key-chord)
  (package-install 'key-chord))
(require 'key-chord)
(setq key-chord-two-keys-delay 0.2)
(key-chord-define evil-visual-state-map "df" 'evil-normal-state)
(key-chord-define evil-insert-state-map "df" 'evil-normal-state)
(key-chord-define evil-visual-state-map "jk" 'evil-normal-state)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-mode 1)
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(doom-modeline key-chord evil-leader evil swiper which-key command-log-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
