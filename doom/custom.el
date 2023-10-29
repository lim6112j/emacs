(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(alchemist-key-command-prefix "C^a")
 '(all-the-icons-dired-monochrome nil)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(dired-auto-revert-buffer t)
 '(dired-create-destination-dirs 'ask t)
 '(dired-dwim-target t)
 '(dired-hide-details-hide-symlink-targets nil)
 '(dired-listing-switches "-ahl -v --group-directories-first")
 '(dired-recursive-copies 'always)
 '(dired-use-ls-dired t)
 '(dired-vc-rename-file t)
 '(doom-themes-treemacs-theme "doom-colors")
 '(flycheck-buffer-switch-check-intermediate-buffers t)
 '(flycheck-clang-include-path '("/usr/local/opt/boost/include"))
 '(flycheck-cppcheck-include-path '("/usr/local/Cellar/boost/1.76.0/include"))
 '(flycheck-display-errors-delay 0.25)
 '(flycheck-display-errors-function 'flycheck-popup-tip-show-popup)
 '(flycheck-emacs-lisp-load-path 'inherit)
 '(flycheck-idle-change-delay 1.0)
 '(flycheck-lua-executable nil)
 '(flycheck-popup-tip-error-prefix "X ")
 '(global-flycheck-mode t)
 '(haskell-interactive-popup-errors nil)
 '(lsp-dart-flutter-sdk-dir "/Users/codeguru/workspace/flutter")
 '(lsp-java-jdt-download-url
   "http://download.eclipse.org/che/che-ls-jdt/snapshots/che-jdt-language-server-latest.tar.gz")
 '(lsp-metals-java-home "")
 '(lsp-pyright-venv-directory nil)
 '(lsp-pyright-venv-path nil)
 '(lsp-xml-format-split-attributes t)
 '(menu-bar-mode nil)
 '(org-agenda-files
   '("~/org/roam/20220917025026-ciel.org" "/Users/codeguru/org/1.org" "/Users/codeguru/org/gecko.org" "/Users/codeguru/org/journal.org" "/Users/codeguru/org/main.org" "/Users/codeguru/org/notes.org" "/Users/codeguru/org/todo.org"))
 '(org-roam-capture-templates
   '(("l" "programming language" plain "* Characteristic\12\12- Family: %?\12- inspired by: \12\12* Reference:\12\12" :target
      (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\12        ")
      :unnarrowed t nil nil)
     ("p" "project" plain "* Goals\12\12%?\12\12* Tasks\12\12** TODO Add initial tasks\12\12* Dates\12\12" :if-new
      (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\12#+filetags: Project")
      :unnarrowed t)
     ("d" "default" plain "%?" :target
      (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\12")
      :unnarrowed t)))
 '(org-roam-db-autosync-mode t)
 '(org-src-lang-modes
   '(("php" . php)
     ("rust" . rustic)
     ("md" . markdown)
     ("C" . c)
     ("C++" . c++)
     ("asymptote" . asy)
     ("bash" . sh)
     ("beamer" . latex)
     ("calc" . fundamental)
     ("cpp" . c++)
     ("ditaa" . artist)
     ("desktop" . conf-desktop)
     ("dot" . fundamental)
     ("elisp" . emacs-lisp)
     ("ocaml" . tuareg)
     ("screen" . shell-script)
     ("shell" . sh)
     ("sqlite" . sql)
     ("toml" . conf-toml)
     ("plantuml" . plantuml)))
 '(package-selected-packages '(company-phpactor))
 '(ranger-override-dired-mode t)
 '(rustic-cargo-bin "~/.cargo/bin/cargo")
 '(sbt:program-options
   '("-Dsbt.supershell=false -java-home /usr/local/Cellar/openjdk@11/11.0.12/libexec/openjdk.jdk/Contents/Home"))
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(treemacs-filewatch-mode t)
 '(treemacs-follow-after-init t)
 '(treemacs-git-mode 'simple)
 '(treemacs-is-never-other-window t)
 '(treemacs-no-png-images nil)
 '(treemacs-sorting 'alphabetic-case-insensitive-asc)
 '(typescript-indent-level 2)
 '(warning-suppress-types '((lsp-mode) (defvaralias))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "nil" :slant normal :weight normal :height 141 :width normal)))))
(put 'customize-group 'disabled nil)
(put 'narrow-to-region 'disabled nil)
