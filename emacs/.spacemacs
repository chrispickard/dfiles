;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(asciidoc
     nginx
     sql
     lua
     ansible
     lsp
     shell-scripts
     common-lisp
     haskell
     nixos
     themes-megapack
     helm
     ;; (erc :variables
     ;;      erc-server-list
     ;;      '(("pickard.cc"
     ;;         :port "5000"
     ;;         :nick "chris")))
     elm
     (rust :variables
           rust-backend 'rls
           rust-format-on-save t)
     javascript
     (go :variables
         ;; go-use-gometalinter t
         go-backend 'lsp
         gofmt-command "goimports"
         go-use-golangci-lint t
         go-format-before-save t
         dap-go-debug-program "~/dev/extensions/go/extension/out/src/goMain.js"
         godoc-at-point-function 'godoc-gogetdoc
         go-tab-width 4)
     yaml
     (auto-completion :variables
                      auto-completion-tab-key-behavior 'cycle
                      ;; auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t)
     ;; auto-completion-enable-company-yasnippet t)
     better-defaults
     (git :variables
          git-gutter-use-fringe t)
     (org
      org-enable-github-support t)
     (syntax-checking :variables syntax-checking-enable-by-default t)
     emacs-lisp
     clojure
     docker
     markdown
     dap
     tmux
     racket
     (elfeed :variables
             rmh-elfeed-org-files '("~/.emacs_custom/elfeed.org"))
     xkcd
     (python :variables
             python-backend 'lsp
             python-enable-yapf-format-on-save t)
     (restclient :variables
                 restclient-use-org t)
     erlang
     ruby
     groovy
     elixir

     (java
      :variables
      lsp-java-save-action-organize-imports nil
      lsp-eldoc-render-all nil
      company-lsp-cache-candidates t
      lsp-highlight-symbol-at-point nil
      java-backend 'lsp)
     ;; vinegar
     html
     (typescript :variables
                 typescript-fmt-on-save t
                 typescript-fmt-tool 'prettier
                 typescript-backend 'lsp
                 )
     confluence
     vimscript)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(evil-mc evil-unimpaired evil-escape spaceline clojure-cheatsheet)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
  This function is called at the very startup of Spacemacs initialization
  before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progess in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to a .PNG file.
   ;; If the value is nil then no banner is displayed.
   ;; dotspacemacs-startup-banner 'official
   dotspacemacs-startup-banner 'official
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   ;; t if you always want to see the changelog at startup
   dotspacemacs-always-show-changelog t
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects bookmarks)

   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(doom-nord)


   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state nil
   dotspacemacs-scratch-mode 'emacs-lisp-mode
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :weight normal
                               :width normal
                               :powerline-scale 1.0
                               :size 10)
   dotspacemacs-mode-line-theme '(doom)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-,"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-emacs-command-key ":"
   ;; If non nil the paste micro-state is enabled. While enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state nil
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar nil
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 100
   dotspacemacs-distinguish-gui-tab t
   dotspacemacs-helm-use-fuzzy 'always
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 100
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   dotspacemacs-highlight-delimiters 'current
   dotspacemacs-folding-method 'origami
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis t
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; dotspacemacs-persistent-server t
   dotspacemacs-enable-server t
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   dotspacemacs-frame-title-format "%I@%S"
   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil
   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil
   dotspacemacs-use-spacelpa nil
   dotspacemacs-additional-packages '(sotlisp
                                      sotclojure
                                      org-gcal
                                      realgud
                                      helm-dash
                                      (tridactyl-mode :location (recipe :fetcher github :repo "Fuco1/tridactyl-mode"))
                                      javadoc-lookup
                                      company-flx
                                      parinfer
                                      company-shell
                                      solaire-mode
                                      atomic-chrome
                                      org-jira
                                      dap-mode
                                      edts
                                      olivetti
                                      string-inflection
                                      ensime
                                      ;; solaire-mode
                                      evil-textobj-syntax
                                      super-save
                                      flycheck-joker
                                      helm-gtags
                                      syntactic-close
                                      concurrent)
   ;; User initialization goes here


   ))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  ;; (setq configuration-layer-elpa-archives '(("melpa" . "melpa.org/packages/")
  ;;                                           ("org" . "orgmode.org/elpa/")
  ;;                                           ("gnu" . "elpa.gnu.org/packages/")))
  (setq solarized-use-variable-pitch nil)
  (setq solarized-use-less-bold t)
  (setq solarized-scale-org-headlines nil))

(defun endless/ispell-word-then-abbrev (p)
  "Call `ispell-word', then create an abbrev for it.
With prefix P, create local abbrev. Otherwise it will
be global.
If there's nothing wrong with the word at point, keep
looking for a typo until the beginning of buffer. You can

skip typos you don't want to fix with `SPC', and you can
abort completely with `C-g'."
  (interactive "P")
  (let (bef aft)
    (save-excursion
      (while (if (setq bef (thing-at-point 'word))
                 ;; Word was corrected or used quit.
                 (if (ispell-word nil 'quiet)
                     nil ; End the loop.
                   ;; Also end if we reach `bob'.
                   (not (bobp)))
               ;; If there's no word at point, keep looking
               ;; until `bob'.
               (not (bobp)))
        (backward-word))
      (setq aft (thing-at-point 'word)))
    (if (and aft bef (not (equal aft bef)))
        (let ((aft (downcase aft))
              (bef (downcase bef)))
          (define-abbrev
            (if p local-abbrev-table global-abbrev-table)
            bef aft)
          (message "\"%s\" now expands to \"%s\" %sally"
                   bef aft (if p "loc" "glob")))
      (user-error "No typo at or before point"))))

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(defun add-lisp-hooks (hook)
  "add hooks to lisp modes of choice"
  (add-hook 'clojure-mode-hook hook)
  (add-hook 'emacs-lisp-mode-hook hook)
  (add-hook 'racket-mode-hook hook))

(defun setup-evilified-state ()
  (bind-map-set-keys evil-evilified-state-map
    "gs"  'magit-status-or-other-dir
    "gc"  'org-capture
    "ga"  'org-agenda
    "gt"  'open-org-todo))

(defun indent-buffer ()
  (aggressive-indent-indent-region-and-on (point-min) (point-max)))

(defun fix-indent ()
  (add-hook 'before-save-hook 'indent-buffer nil 'make-it-local))

(defun remove-bolds ()
  ;; let's remove those bolds, shall we?
  (mapc
   (lambda (face)
     (set-face-attribute face nil :weight 'normal :underline nil))
   (face-list)))

(defmacro define-and-bind-text-object (key start-regex end-regex)
  (let ((inner-name (make-symbol "inner-name"))
        (outer-name (make-symbol "outer-name")))
    `(progn
       (evil-define-text-object ,inner-name (count &optional beg end type)
         (evil-select-paren ,start-regex ,end-regex beg end type count nil))
       (evil-define-text-object ,outer-name (count &optional beg end type)
         (evil-select-paren ,start-regex ,end-regex beg end type count t))
       (define-key evil-inner-text-objects-map ,key (quote ,inner-name))
       (define-key evil-outer-text-objects-map ,key (quote ,outer-name)))))

(defun my/projectile-return-project-name (&optional arg)
  "Switch to a project we have visited before.
Invokes the command referenced by `projectile-switch-project-action' on switch.
With a prefix ARG invokes `projectile-commander' instead of
`projectile-switch-project-action.'"
  (interactive "P")
  (let ((projects (projectile-relevant-known-projects)))
    (if projects
        (projectile-completing-read
         "Switch to project: " projects
         :action (lambda (project) project))
      (user-error "There are no known projects"))))

(defun my/do-action ()
  "do actions"
  (interactive)
    (lsp-ui-sideline-apply-code-actions))

(defun my-adjoin-to-list-or-symbol (element list-or-symbol)
  (let ((list (if (not (listp list-or-symbol))
                  (list list-or-symbol)
                list-or-symbol)))
    (require 'cl-lib)
    (cl-adjoin element list)))

(defun magit-status-or-other-dir (&optional arg)
  "docstring"
  (interactive "P")
  (if arg
      (magit-status (my/projectile-return-project-name))
    (magit-status)))


;; (defvar ignore-switch-to-list '() "if a value is consed into this var, it will be treated as a regex of windows to skip")

;; (defun select-window-except ()
;;   ""
;;   (interactive)
;;   (when 
;;       (-contains? ignore-switch-to-list (next-window)
;;                   (other-window))))
(defun next-error-cycle ()
  (interactive)
  (condition-case nil (flycheck-next-error) 
    (error (goto-char (point-min))
           (flycheck-next-error 1))) )

(defun previous-error-cycle ()
  (interactive)
  (condition-case nil (flycheck-previous-error) 
    (error (goto-char (point-max))
           (flycheck-previous-error 1))) )

(defun turn-off-smartparens ()
  (turn-off-smartparens-mode)
  (turn-off-show-smartparens-mode)
  (electric-pair-mode -1))

(defun dotspacemacs/user-config ()
  "Configuration function.
   This function is called at the very end of Spacemacs initialization after
  layers configuration."
  (setq-default powerline-default-separator 'arrow)
  (setq dotspacemacs-mode-line-unicode-symbols nil)
  (spacemacs/toggle-highlight-current-line-globally-off)
  (setq solarized-use-more-italic t)

  ;; (bind-key (kbd "M-;") 'ivy-switch-buffer)

  ;; (load-file "~/.emacs_custom/setup-font.el")
  (setq ns-use-srgb-colorspace nil)
  (setq abbrev-file-name "~/.abbrevs")
  (setq save-abbrevs 'silently)
  (setq-default abbrev-mode t)
  (quietly-read-abbrev-file)
  (setq evil-search-module 'evil-search)
  (setq create-lockfiles nil)
  (setq auto-window-vscroll nil)

  (add-to-list 'evil-emacs-state-modes 'elfeed-search-mode)
  (add-to-list 'evil-emacs-state-modes 'elfeed-show-mode)
  (setq shr-width 80)

  (setq ediff-window-setup-function 'ediff-setup-windows-default)

  (bind-key (kbd "M-;") 'helm-mini)

  ;; (define-key evil-inner-text-objects-map (kbd "w") 'evil-inner-symbol)
  ;; (define-key evil-inner-text-objects-map (kbd "o") 'evil-inner-word)
  (bind-key (kbd "M-m") 'other-window )
  ;; (bind-key (kbd "M-s") 'sp-forward-slurp-sexp )
  (keyboard-translate ?\C-i ?\H-i)
  (global-set-key [?\H-i] 'evil-jump-forward)
  ;; (bind-key (kbd "C-M-s") 'sp-forward-barf-sexp )

  (bind-key (kbd "<f2>") 'begin-defect-capture)

  (unbind-key (kbd "s") evil-normal-state-map)
  ;; (unbind-key (kbd "s") evil-cleverparens-mode-map)

  ;; (bind-map-set-keys evil-cleverparents-mode-map
  ;;   "gc"  'org-capture
  ;;   "g/"  'helm-swoop
  ;;   "ga"  'org-agenda
  ;;   "gs"  'magit-status-or-other-dir
  ;;   "ss"   'evil-avy-goto-char-2
  ;;   "M-n"  'next-error-cycle
  ;;   "M-p"  'previous-error-cycle
  ;;   "sc"   'avy-goto-char
  ;;   "sl"   'evil-avy-goto-line
  ;;   "gl"  'flycheck-error-list
  ;;   "gt"  'open-org-todo)
  (setq nord-comment-brightness 20)
  (setq nord-region-highlight "frost")
  (setq doom-enable-bold nil)
  ;; (doom-themes-org-config)
  (setq lsp-auto-guess-root t)
  ;; (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-doc-enable nil)

  ;; brighten buffers (that represent real files)
  (add-hook 'change-major-mode-hook #'turn-on-solaire-mode)

  ;; ...if you use auto-revert-mode, this prevents solaire-mode from turning
  ;; itself off every time Emacs reverts the file
  (add-hook 'after-revert-hook #'turn-on-solaire-mode)
  (solaire-global-mode +1)
  ;; (solaire-mode-swap-bg)

  ;; (setq nord-region-highlight "snowstorm")

   (bind-map-set-keys evil-normal-state-map
     "gc"  'org-capture
     "g/"  'helm-swoop
     "ga"  'org-agenda
     "gs"  'magit-status-or-other-dir
     "s"  'evil-avy-goto-word-1
     ;; "ss"   'evil-avy-goto-char-2
     "M-n"  'next-error-cycle
     "M-p"  'previous-error-cycle
     ;; "sc"   'avy-goto-char
     ;; "sl"   'evil-avy-goto-line
     "gl"  'flycheck-error-list
     "gt"  'open-org-todo)

   (with-eval-after-load 'cc-mode
     (bind-map-set-keys java-mode-map
       "<S-f6>"  'lsp-rename))

   (with-eval-after-load 'go-mode
       (bind-map-set-keys go-mode-map
         "<S-f6>"  'go-rename))

   (with-eval-after-load 'lsp-ui
     (bind-map-set-keys lsp-ui-mode-map
       "M-RET"  'my/do-action))

   (bind-map-set-keys evil-normal-state-map
     "C-b" 'evil-first-non-blank
     "C-e" 'evil-end-of-line)

  ;; (setq scroll-conservatively 101) ;; move minimum when cursor exits view, instead of recentering

  ;; until the minibuffer is closed
  (defun my-minibuffer-setup-hook (&optional arg)
    (setq gc-cons-threshold most-positive-fixnum))

  (defun my-minibuffer-exit-hook (&optional arg)
    (setq gc-cons-threshold 800000))

  ;; (setq helm-candidate-number-limit 50)
  (add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
  (add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)

  (super-save-mode +1)
  (diminish 'super-save-mode "ss")
  (spacemacs/set-leader-keys "l" 'avy-goto-line)
  (spacemacs/set-leader-keys "w/" 'split-window-right-and-focus)
  (spacemacs/set-leader-keys "w-" 'split-window-below-and-focus)
  (spacemacs/set-leader-keys "SPC" 'helm-semantic-or-imenu)

  ;; (add-lisp-hooks #'smartparens-strict-mode)
  ;; (add-lisp-hooks #'evil-cleverparens-mode)
  ;; (add-lisp-hooks #'evil-smartparens-mode)
  ;; (add-lisp-hooks #'smartparens-mode)
  (add-lisp-hooks #'electric-pair-mode)
  (add-hook 'prog-mode-hook #'spacemacs/toggle-fill-column-indicator-on)
  ;; (add-hook 'prog-mode-hook #'hasklig-mode)
  (add-hook 'prog-mode-hook #'spacemacs/toggle-line-numbers-on)
  (add-hook 'prog-mode-hook #'(lambda () (setq fill-column 100)))

  (add-hook 'text-mode-hook #'spacemacs/toggle-fill-column-indicator-on)
  (add-hook 'text-mode-hook #'(lambda () (setq fill-column 100)))
  (add-hook 'text-mode-hook #'auto-fill-mode)
  ;; (add-hook 'text-mode-hook 'variable-pitch-mode)

  (modify-syntax-entry ?_ "w")
  (modify-syntax-entry ?- "w")
  ;; (add-lisp-hooks #'aggressive-indent-mode)
  ;; (add-lisp-hooks #'modify-lisp-syntax)
  ;; (add-lisp-hooks #'evil-cleverparens-mode)
  ;;(add-hook 'java-mode-hook (lambda () (add-to-list 'spacemacs-jump-handlers 'helm-gtags-find-tag-from-here)))
  (add-hook 'java-mode-hook 'semantic-mode)
  ;; (add-hook 'elixir-mode-hook 'turn-off-smartparens)
  ;;(define-key java-mode-map (kbd "SPC-m,") '(meghanada-run-task "clean package"))

  (add-hook 'web-mode-hook (lambda() (define-key web-mode-map (kbd "M-;") nil)))
  ;; (add-lisp-hooks 'fix-indent)
  (add-hook 'prog-mode-hook #'yas-minor-mode)
  (setq parinfer-extensions '(defaults pretty-parens evil smart-tab smart-yank))
  ;; skips 'vendor' directories and sets GO15VENDOREXPERIMENT=1
  ;; (setq flycheck-gometalinter-vendor t)
  (setq flycheck-elixir-credo-strict t)
  ;; only show errors
  ;; (setq flycheck-gometalinter-errors-only t)
  ;; only run fast linters
  ;; (setq flycheck-gometalinter-fast t)
  ;; use in tests files
  ;; (setq flycheck-gometalinter-test t)
  ;; (setq flycheck-gometalinter-disable-all t)
  (setq flycheck-idle-change-delay 0.01)
  (setq mac-command-modifier 'super)
  (setq mac-option-modifier 'meta)
  ;; (remove-hook 'prog-mode-hook #'smartparens-mode)
  (remove-hook 'prog-mode-hook #'aggressive-indent-mode)
  (remove-hook 'prog-mode-hook #'flycheck-pos-tip)
  ;; (remove-hook 'go-mode-hook #'flycheck-pos-tip)
  (remove-hook 'prog-mode-hook #'smartparens-strict-mode)
  (remove-hook 'prog-mode-hook #'evil-smartparens-mode)
  ;; (remove-hook 'prog-mode-hook #'evil-cleverparens-mode)

  (add-hook 'prog-mode-hook 'company-mode)
  (add-lisp-hooks 'show-paren-mode)

  (add-hook 'spacemacs-post-theme-change-hook '(lambda () (setq solarized-use-variable-pitch nil)
                                                 (setq solarized-scale-org-headlines nil)))
  (setq solarized-use-variable-pitch nil)
  (setq solarized-scale-org-headlines nil)
  ;; (add-hook 'spacemacs-post-theme-change-hook 'remove-bolds)
  ;; (setq evil-cleverparens-use-regular-insert t)
  (with-eval-after-load 'yasnippet
    (yas-global-mode 1)
    (define-key yas-minor-mode-map (kbd "M-SPC") #'yas-expand))
  (global-auto-revert-mode 1)

  (with-eval-after-load 'evil
    (require 'evil-textobj-syntax))

  (with-eval-after-load 'lsp-mode
    (setq lsp-prefer-flymake :none))

  (with-eval-after-load 'org
    (load-file "~/.emacs_custom/setup-org.el"))

  (with-eval-after-load 'company
    (setq company-flx-limit 20)
    (company-flx-mode 1)
    (setq company-idle-delay 0.2)
    (bind-map-set-keys company-active-map
      "C-k" 'company-select-previous
      "C-j" 'company-select-next))

  ;; This is clutch, need to keep this around
  ;; (setq show-paren-style 'expression)

  (setq alert-default-style 'libnotify)
  (load-file (expand-file-name "~/.emacs_custom/show-paren-custom.el"))

  ;;  (setq elpy-rpc-python-command "python4")
  ;; (elpy-use-ipython)
  ;; shell script hook
  (add-hook 'shell-script-enabled-hook #'flycheck-mode)

  ;;(add-hook 'python-mode-hook 'set-python-interpreter)
  ;; elisp hooks
  (add-hook 'emacs-lisp-mode-hook 'prettify-symbols-mode)
  ;; (add-hook 'prog-mode-hook 'real-auto-save-mode)

  (require 'sotlisp)
  (add-hook 'emacs-lisp-mode-hook 'sotlisp-mode)

  (add-hook 'doc-view-mode-hook 'auto-revert-mode)

  (defadvice spacemacs/jump-to-definition-other-window (after jump-to-def-other-window-center activate)
    (evil-scroll-line-to-center nil))

  (defadvice spacemacs/jump-to-definition (after jump-to-def-center activate)
    (evil-scroll-line-to-center nil))

  (defadvice sotlisp-find-or-define-function (before sotlisp-push-jump activate)
    (evil--jumps-push))
  (defadvice sotlisp-find-or-define-variable (before sotlisp-push-jump-var activate)
    (evil--jumps-push))

  (defadvice sotclojure-find-or-define-function (before sotclojure-push-jump activate)
    (evil--jumps-push))
  (defadvice sotclojure-find-or-define-variable (before sotclojure-push-jump-var activate)
    (evil--jumps-push))

  (defadvice meghanada-local-variable (before save-before-local-var activate)
    (save-buffer))

  ;; when using sotlisp enter insert mode upon using the insert parens funcs
  (defadvice sotlisp-newline-and-parentheses
      (after enter-insert-mode-after-newline activate)
    (evil-insert-state))
  (defadvice sotlisp-downlist-newline-and-parentheses
      (after enter-insert-mode-after-downlist activate)
    (evil-insert-state))

  (add-to-list 'spacemacs-large-file-modes-list 'tags-table-mode)

  (defadvice sotlisp-newline-and-parentheses
      (before end-of-sexp-before-newline activate)
    (sp-end-of-sexp))

  (defadvice move-past-close-and-reindent
      (after end-of-sexp-reindent activate)
    (evil-indent-line))

  ;; remove cursor on inactive windows
  (defadvice select-window (before nil-cursor-out activate)
    (setq cursor-type nil))

  ;; (defadvice server-edit (after reopen-iterm activate)
  ;;   (shell-command "open -a iTerm"))

  ;; (defadvice elfeed-goodies/show-ace-link (after move-cursor-right activate)
  ;;   (link-hint-open-link-at-point (right-char 1)))

  (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode-disable)
  (add-hook 'clojure-mode-hook 'sotclojure-mode)
  ;(add-hook 'emacs-lisp-mode-hook 'sotlisp-mode)

  (setq clojure-enable-fancify-symbols t)

  ;; (defadvice org-ctrl-c-ctrl-c (after move-down activate)
  ;;   (org-next-item))

  ;; (load-file "dev/add-default-commit.el")
  ;; (load-file (expand-file-name "~/dev/word_change.el"))
  (add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
  (add-hook 'git-commit-mode-hook 'evil-insert-state)
  (add-hook 'git-commit-mode-hook 'yas-minor-mode)
  ;; (add-hook 'java-mode-hook 'meghanada-mode)
  (setq helm-dash-browser-func 'eww-browse-url)
  (setq browse-url-browser-function 'browse-url-generic
        browse-url-generic-program "firefox")

  ;; (add-to-list 'company-backends 'company-shell)
  (setq ac-auto-show-menu t
        ac-auto-start t
        ac-show-menu-immediately-on-auto-complete t)


  ;; (custom-set-variables '(org-trello-files '("~/trello/todo.org")))

  ;; gets rid of that awful highlighting smartparens wanted to do when you open a new pair
  (setq sp-highlight-pair-overlay nil)

  ;; (add-hook 'web-mode-hook (lambda () (bind-key (kbd "M-;") 'ivy-switch-buffer)))

  (remove-hook 'prog-mode-hook #'smartparens-mode #'show-smartparens-mode)
  (spacemacs/toggle-smartparens-globally-off)

  (add-hook 'shell-mode-hook (lambda () (progn (smartparens-mode 0)
                                               (show-smartparens-mode 0))))
  (bind-map-set-keys ctl-x-map
    "H-i" 'endless/ispell-word-then-abbrev
    "C-l" 'evil-complete-previous-line)
  (add-hook 'evil-evilified-state-entry-hook 'setup-evilified-state)
  (setq twittering-icon-mode t)
  (setq twittering-use-icon-storage t)
  ;; (setq ivy-height 6)
  ;; (setq ivy-re-builders-alist
  ;;       '((ivy-switch-buffer . ivy--regex-plus)
  ;;         (t . ivy--regex-fuzzy)))

  (setq inferior-lisp-program "ros -Q run")

  (when (memq window-system '(mac ns x)))
  ;; (setq gofmt-command "")
  (add-hook 'go-mode-hook 'gofmt-before-save)
  ;; (add-hook 'go-mode-hook '(lambda (bind-key (kbd "<S-f6>") 'helm-mini)))
  ;; (add-hook 'go-mode-hook (lambda () (bind-key (kbd "<S-f6>") 'go-rename)))
  ;; (add-hook 'java-mode-hook (lambda () (bind-key (kbd "<S-f6>") 'lsp-rename)))
  (add-hook 'lsp-hook '(setq flycheck-checker 'golangci-lint))
  ;; (setq godoc-and-godef-command "~/dev/golang/bin/gocode")
  ;; (setq company-go-gocode-command "~/dev/golang/bin/gocode")
  (setq cider-cljs-lein-repl
        "(do (require 'figwheel-sidecar.repl-api)
          (figwheel-sidecar.repl-api/start-figwheel!)
          (figwheel-sidecar.repl-api/cljs-repl))")

  (setq meghanada-javac-xlint "-Xlint:all,-processing")

  (setq dotspacemacs-frame-title-format "emacs@chris")

  (define-key spacemacs-buffer-mode-map (kbd "u") 'configuration-layer/update-packages)
  ;; (push 'godoc-mode popwin:special-display-config)
  ;; (with-eval-after-load 'godoc
  ;;   (bind-map-set-keys godoc-mode-map
  ;;     "q" 'view-quit))

  ;; (setq godoc-at-point-function #'godoc-and-godef)

  ;; (with-eval-after-load 'flycheck
  ;;   (add-hook 'flycheck-error-list-mode-hook
  ;;             (lambda () (set-window-parameter (first (window-list)) 'no-other-window t))))

  ;; (require 'ivy-rich)
  ;; (ivy-set-display-transformer 'ivy-switch-buffer 'ivy-rich-switch-buffer-transformer)

  ;; (setq shell-file-name "/bin/bash")
  (setq projectile-enable-caching t)

  (setq avy-background t)
  (setq avy-highlight-first nil)

  (setq frame-resize-pixelwise t)
  ;; require magit here so that it can be used as $EDITOR with it initted already
  (require 'magit)
  ;; (server-start)
  ;; skips 'vendor' directories and sets GO15VENDOREXPERIMENT=1
  ;; (setq flycheck-gometalinter-vendor t)
  ;; only show errors
  ;; (setq flycheck-gometalinter-errors-only t)
  ;; only run fast linters
  ;; (setq flycheck-gometalinter-fast t)
  ;; use in tests files
  ;; (setq flycheck-gometalinter-test t)
  ;; disable linters
  ;; (setq flycheck-gometalinter-disable-linters '("gas"))
  (setq dotspacemacs-large-file-size 2)
  (setq lsp-go-gocode-completion-enabled t)
  ;; (require 'flycheck)
  ;; (require 'lsp-mode)
  ;; (require 'lsp-ui)
  ;; (setq lsp-prefer-flymake :none)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
'(markdown-command "/opt/pandoc/bin/pandoc")
 '(ahs-case-fold-search nil t)
 '(ahs-default-range (quote ahs-range-whole-buffer) t)
 '(ahs-idle-interval 0.25 t)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil t)
 '(js2-missing-semi-one-line-override nil)
 '(js2-strict-missing-semi-warning nil)
 '(magit-use-overlays nil)
 '(package-selected-packages
   (quote
    (yapfify erlang visual-fill-column writeroom-mode go-guru winum parinfer live-py-mode seq spinner spotify pcache atomic-chrome websocket eyebrowse multiple-cursors rubocop pdf-tools ob-elixir ivy-purpose window-purpose imenu-list hide-comnt column-enforce-mode inflections inf-ruby yaml-mode minitest pug-mode ruby-test-mode mwim company-shell robe macrostep elfeed-goodies counsel-projectile undo-tree elixir-mode s evil-cleverparens intero hlint-refactor hindent haskell-snippets flycheck-haskell company-ghci company-ghc ghc haskell-mode company-cabal cmm-mode meghanada alchemist clang-format elpy fzf alert hydra groovy-mode org-projectile org-jira evil-ediff dumb-jump bundler git-commit with-editor f web-mode tagedit slim-mode scss-mode sass-mode less-css-mode jade-mode haml-mode emmet-mode company-web web-completion-data git-link find-file-in-project suggest loop flycheck-clojure rake company-go clojure-snippets org auto-compile ensime sbt-mode scala-mode org-download flycheck-mix swiper iedit ivy auctex-latexmk auctex tern restclient counsel magit-popup clojure-mode sotclojure vimrc-mode dactyl-mode async auto-complete confluence toc-org org-repo-todo org-present org-pomodoro org-plus-contrib org-bullets htmlize gnuplot avy anzu highlight flycheck request projectile helm-core yasnippet js2-mode markdown-mode evil fireplace cider smartparens company helm magit elfeed sotlisp sx beacon xkcd ws-butler window-numbering which-key web-beautify volatile-highlights vi-tilde-fringe use-package spacemacs-theme spaceline solarized-theme smooth-scrolling smeargle restart-emacs ranger rainbow-delimiters racket-mode quelpa pyvenv pytest pyenv-mode popwin pip-requirements persp-mode pcre2el paradox page-break-lines orgit open-junk-file neotree move-text mmm-mode markdown-toc magit-gitflow lorem-ipsum linum-relative leuven-theme json-mode js2-refactor js-doc indent-guide ido-vertical-mode hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gitconfig-mode gitattributes-mode git-timemachine git-messenger gh-md flycheck-pos-tip flx-ido fill-column-indicator fancy-battery expand-region evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-jumper evil-indent-plus evil-iedit-state evil-exchange evil-args evil-anzu emacs-eclim define-word cython-mode company-tern company-statistics company-quickhelp company-anaconda coffee-mode clj-refactor clean-aindent-mode cider-eval-sexp-fu buffer-move auto-yasnippet auto-highlight-symbol align-cljlet aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t)
 '(ring-bell-function (quote ignore))
 '(send-mail-function (quote mailclient-send-it))
 '(vc-follow-symlinks t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :underline nil)))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(js2-missing-semi-one-line-override nil)
 '(js2-strict-missing-semi-warning nil)
 '(magit-use-overlays nil)
 '(markdown-command "/opt/pandoc/bin/pandoc")
 '(package-selected-packages
   (quote
    (flycheck-golangci-lint yapfify erlang visual-fill-column writeroom-mode go-guru winum parinfer live-py-mode seq spinner spotify pcache atomic-chrome websocket eyebrowse multiple-cursors rubocop pdf-tools ob-elixir ivy-purpose window-purpose imenu-list hide-comnt column-enforce-mode inflections inf-ruby yaml-mode minitest pug-mode ruby-test-mode mwim company-shell robe macrostep elfeed-goodies counsel-projectile undo-tree elixir-mode s evil-cleverparens intero hlint-refactor hindent haskell-snippets flycheck-haskell company-ghci company-ghc ghc haskell-mode company-cabal cmm-mode meghanada alchemist clang-format elpy fzf alert hydra groovy-mode org-projectile org-jira evil-ediff dumb-jump bundler git-commit with-editor f web-mode tagedit slim-mode scss-mode sass-mode less-css-mode jade-mode haml-mode emmet-mode company-web web-completion-data git-link find-file-in-project suggest loop flycheck-clojure rake company-go clojure-snippets org auto-compile ensime sbt-mode scala-mode org-download flycheck-mix swiper iedit ivy auctex-latexmk auctex tern restclient counsel magit-popup clojure-mode sotclojure vimrc-mode dactyl-mode async auto-complete confluence toc-org org-repo-todo org-present org-pomodoro org-plus-contrib org-bullets htmlize gnuplot avy anzu highlight flycheck request projectile helm-core yasnippet js2-mode markdown-mode evil fireplace cider smartparens company helm magit elfeed sotlisp sx beacon xkcd ws-butler window-numbering which-key web-beautify volatile-highlights vi-tilde-fringe use-package spacemacs-theme spaceline solarized-theme smooth-scrolling smeargle restart-emacs ranger rainbow-delimiters racket-mode quelpa pyvenv pytest pyenv-mode popwin pip-requirements persp-mode pcre2el paradox page-break-lines orgit open-junk-file neotree move-text mmm-mode markdown-toc magit-gitflow lorem-ipsum linum-relative leuven-theme json-mode js2-refactor js-doc indent-guide ido-vertical-mode hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gitconfig-mode gitattributes-mode git-timemachine git-messenger gh-md flycheck-pos-tip flx-ido fill-column-indicator fancy-battery expand-region evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-jumper evil-indent-plus evil-iedit-state evil-exchange evil-args evil-anzu emacs-eclim define-word cython-mode company-tern company-statistics company-quickhelp company-anaconda coffee-mode clj-refactor clean-aindent-mode cider-eval-sexp-fu buffer-move auto-yasnippet auto-highlight-symbol align-cljlet aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t)
 '(ring-bell-function (quote ignore))
 '(safe-local-variable-values
   (quote
    ((eval progn
           (pp-buffer)
           (indent-buffer))
     (typescript-backend . tide)
     (typescript-backend . lsp)
     (javascript-backend . tern)
     (javascript-backend . lsp)
     (go-backend . go-mode)
     (go-backend . lsp)
     (elixir-enable-compilation-checking . t)
     (elixir-enable-compilation-checking))))
 '(send-mail-function (quote mailclient-send-it))
 '(vc-follow-symlinks t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :underline nil)))))
)
