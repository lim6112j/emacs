;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Ben Lim"
      user-mail-address "lim6112j@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
;;(setq doom-font (font-spec :family "D2Coding" :size 14))
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(setq haskell-stylish-on-save t)
(after! counsel
  (setq counsel-rg-base-command "rg -M 240 --with-filename --no-heading --line-number --color never %s || true"))
(add-hook! 'org-mode-hook #'+org-init-keybinds-h)
(setq evil-snipe-override-evil-repeat-keys nil)
(setq doom-localleader-key ",")
(setq doom-localleader-alt-key "M-,")
;; (evil-define-key 'normal 'global (kbd "<leader>fs") 'save-buffer)
(map! :leader
      (:prefix-map ("a" . "window-size")
        :desc "window-shrink-height" "h" #'evil-window-set-height
        :desc "widonw-shrink-width" "w" #'evil-window-set-width
        :desc "org-roam-id-refresh" "r" #'(org-id-update-id-locations (org-roam--list-all-files))
      )
)
;; (setq org-agenda-files
;;       (append
;;        (file-expand-wildcards "~/workspace/org-documents/*.org")))
(use-package! lsp-mode
  :commands lsp
  :hook
  (elixir-mode . lsp)
  :init
  (add-to-list 'exec-path "~/.elixir-ls/release")
)
(use-package! lsp-mode
  :commands lsp
  :hook
  (kotlin-mode . lsp)
)
(setq lsp-clients-clangd-args '("-j=3"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=never"
                                "--header-insertion-decorators=0"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))
(use-package! evil-escape

:init

(setq evil-escape-key-sequence "df"))
(setq-default evil-escape-delay 0.2)
;; poetry
;;(use-package! poetry
  ;;:ensure t
  ;;;; :init
  ;;;; imperfect tracking strategy causes lags in builds
  ;;;; (setq poetry-tracking-strategy 'switch-buffer)
  ;;:hook
  ;;;; activate poetry-tracking-mode when python-mode is active
  ;;(python-mode . poetry-tracking-mode)
  ;;)
(setq-default enable-local-variables t)
;; Set global LSP options
(after! lsp-mode (
setq lsp-lens-enable t
lsp-ui-peek-enable t
lsp-ui-doc-enable nil
lsp-ui-doc-position 'bottom
lsp-ui-doc-max-height 70
lsp-ui-doc-max-width 150
lsp-ui-sideline-show-diagnostics t
lsp-ui-sideline-show-hover nil
lsp-ui-sideline-show-code-actions t
lsp-ui-sideline-diagnostic-max-lines 20
lsp-ui-sideline-ignore-duplicate t
lsp-ui-sideline-enable t))
(use-package! lsp-sourcekit
  :after lsp-mode
  :config
  (setq lsp-sourcekit-executable (string-trim (shell-command-to-string "xcrun --find sourcekit-lsp"))))
(use-package! swift-mode
  :hook (swift-mode . (lambda () (lsp))))
;; control return like shift return on intellij
(define-key evil-normal-state-map (kbd "C-<return>") #'evil-open-below)
