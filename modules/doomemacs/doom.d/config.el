;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Chris Pickard"
      user-mail-address "chris.pickard@tangramflex.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Iosevka" :size 22 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "DejaVu Sans" :size 22))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(map! :desc "next window" :g "M-m" #'evil-window-next
      :desc "show buffers" :g "M-;" #'consult-buffer
      :n :desc "move to beginning of line" "C-a" #'beginning-of-line-text
      :leader :desc "toggle between recent buffers" "TAB" #'evil-switch-to-windows-last-buffer
      :leader :n :desc "open M-x" "SPC" #'execute-extended-command
      :leader :n :desc "clear highlighting" "sc" #'evil-ex-nohighlight
      :leader :n :desc "comment region" ";" #'evilnc-comment-operator)

(after! evil
  (map! :n "C-e" #'end-of-line
        :v "s" #'evil-surround-region
        :o "s" #'evil-surround-edit
        :o "s" #'evil-Surround-edit
        :n "-" #'ranger
        )
  )

(map! :after with-editor
      :map with-editor-mode-map
      :localleader :desc "accept" "," #'with-editor-finish
      :localleader :desc "decline" "k" #'with-editor-cancel)


(defun open-notmuch-search ()
  (notmuch-search "tag:inbox"))

(defun send-via-gmi ()
  (message (message-fetch-field "from"))
  (let ((from (message-fetch-field "from")))
    (cond ((string= from "chrispickard9@gmail.com") (setq message-sendmail-extra-arguments '("send" "--quiet" "-t" "-C" "~/.mail/personal")))
          ((string= from "chris.pickard@tangramflex.com") (setq message-sendmail-extra-arguments '("send" "--quiet" "-t" "-C" "~/.mail/work")))
          ((string= from "thephoenixforce9@gmail.com") (setq message-sendmail-extra-arguments '("send" "--quiet" "-t" "-C" "~/.mail/tpf")))
          )
    )
  )

(setq +notmuch-home-function #'open-notmuch-search)
(setq notmuch-search-result-format '(("authors" . "%-30s ")
                                     ("subject" . "%-72s ")
                                     ("date" . "%12s ")
                                     ("count" . "%-7s ")
                                     ("tags" . "(%s)")))
(setq company-box-doc-enable nil)
(map! :after notmuch
      :map notmuch-search-mode-map
      :v "e" #'notmuch-search-archive-thread
      :n "e" #'notmuch-search-archive-thread)

(map! :after notmuch
      :map notmuch-search-mode-map
      :v "z" #'notmuch-tag-undo
      :n "z" #'notmuch-tag-undo)

(after! notmuch
  (setq notmuch-fcc-dirs nil)
  (setq +notmuch-sync-backend "notmuch new")
  ;; (add-hook! 'notmuch-hooks)
  (add-hook 'message-mode-hook #'notmuch-address-setup)
  (add-hook 'message-mode-hook #'notmuch-company-setup)
  ;; (setq notmuch-show-text/html-blocked-images nil)
  (setq sendmail-program "gmi")
  (add-hook 'message-send-hook #'send-via-gmi))

(after! cc-mode
  (eldoc-mode -1))

(map! :after notmuch
      :map notmuch-message-mode-map
      :localleader :desc "accept" "," #'message-send-and-exit
      :localleader :desc "decline" "k" #'message-dont-send)

(after! (setq ranger-deer-show-details t))

(setq consult-preview-key "M-.")
(setq doom-localleader-key ",")

(setq frame-title-format '("emacs@chris"))

(setq emacs-everywhere-frame-name-format "emacs-everywhere@chris")

(after! circe
  (set-irc-server! "irc.libera.chat"
    `(:tls t
      :port 6697
      :nick "doom"
      :sasl-username "chris.pickard"
      :sasl-password "mypassword"
      :channels ("#emacs"))))

                                        ; TODO org-protocol
(setq org-capture-templates
      `(
	("p" "Protocol" entry (file+headline ,(concat org-directory "notes.org") "Inbox")
         "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
	("L" "Protocol Link" entry (file+headline ,(concat org-directory "notes.org") "Inbox")
         "* %? [[%:link][%:description]] \nCaptured On: %U")
        ))

(set-popup-rule! "\\*notmuch update\\*")
(setq global-eldoc-mode nil)

(setq +format-on-save-enabled-modes '(not cc-mode c-mode))

;; Hacky generic mode for flex

;; To use put in a directory like ~/.emacs.d/lisp/
;; and add that directory to the load-path in the ~/.emacs init file
;; then load the file

;; Ex:
;; (add-to-list 'load-path "~/.emacs.d/lisp/")
;; (load "flex-mode")

(require 'generic-x)

(define-generic-mode
  'flex-mode                          ;; name of the mode
  '("//" ("/*" . "*/"))                ;; comments delimiter
  '("function" "transform" "let" "struct" "enum" "as" "variant"
    "variant" "import" "module" "type" "extends" "match"
    "constrainedtype" "newtype" "if" "const" "for" "in" "message" "bit")      ;; some keywords
   ;; '(("%{\\([A-Z_]+\\)}" 1 font-lock-variable-name-face)
   ;;      ("\\b[0-9][0-9][0-9]\\b" . font-lock-constant-face))
   ;;      ("\\[.*\\]" . font-lock-type-face))
  '(("=" . 'font-lock-operator)
    ("+" . 'font-lock-operator)     ;; some operators
    ("->" . 'font-lock-operator)
    ("^\\s-*transform\\s-+\\([A-Za-z0-9_]+\\)"
     (1 font-lock-function-name-face))
    ("^\\s-*function\\s-+\\([A-Za-z0-9_]+\\)"
     (1 font-lock-function-name-face))
    ("^\\s-*let\\s-+\\([A-Za-z0-9_]+\\)"
     (1 font-lock-variable-name-face))
    (";" . 'font-lock-builtin))     ;; a built-in
  '("\\.flex$")                    ;; files that trigger this mode
  '((lambda () (modify-syntax-entry ?' "\"")))    ;; any other functions to call
  "Flex custom highlighting mode"     ;; doc string
)
