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
(setq mac-command-modifier      'super
      ns-command-modifier       'super
      mac-option-modifier       'meta
      ns-option-modifier        'meta
      mac-right-option-modifier 'none
      ns-right-option-modifier  'none)
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
;; lsp
(unless (package-installed-p 'lsp-mode)
  (package-install 'lsp-mode))
(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "s-l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         ;;(xxx-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
;;(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)
;; optionally if you want to use debugger
(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
    :config
    (which-key-mode))
;; Enable Evil
(require 'evil-leader)
(global-evil-leader-mode)
(unless (package-installed-p 'evil-leader)
  (package-install 'evil-leader))
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "w" 'evil-window-map
  "d" 'dired
  "p" 'projectile-command-map
  "f f" 'find-file
  "f s" 'save-buffer
  "b b" 'helm-mini
  "b k" 'kill-buffer
  "," 'ivy-switch-buffer
  "t f" 'treemacs-create-file
  "t d" 'treemacs-create-dir
  "q q" 'save-buffers-kill-emacs
  "g g" 'magit-status
  "e" 'eval-region
  ":" 'execute-extended-command
  "/" 'project-search
  "s" 'shell)

(require 'evil)
(evil-mode 1)
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
(use-package projectile)
(projectile-mode +1)
;; Recommended keymap prefix on macOS
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;; Recommended keymap prefix on Windows/Linux
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(unless (package-installed-p 'magit)
  (package-install 'magit))

(unless (package-installed-p 'helm)
  (package-install 'helm))
(require 'helm)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(helm magit projectile projectile-mode doom-modeline key-chord evil-leader evil swiper which-key command-log-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
