(defun defect-capture ()
  "uses org-capture-plist to create defect"
  (concat (format "** %s:%d " defect-file-name defect-line-number) "%?"))

(setq org-capture-templates
      '(("n" "Note" entry
         (file+headline "~/org/notes.org" "Notes")
         "** %?")
        ("d" "Defect" entry
         (file+headline "~/org/defects.org" "Defects")
         (function defect-capture))))

(defun log-defect-terminal (file n)
  "docstring"
  (shell-command "btf emacs@chris emacs")
  (log-defect file n))

(defun log-defect-emacs ()
  "docstring"
  (interactive)
  (log-defect (buffer-name) (line-number-at-pos))
  )
(bind-key (kbd "<f2>") 'log-defect-emacs)
(defun log-defect (file n)
  "logs a defect in file `file` at line number `n`"
  (setq defect-file-name file)
  (setq defect-line-number n)
  (org-capture nil "d"))

(require 'elfeed-org)
(elfeed-org)
(setq rmh-elfeed-org-files (list "~/.emacs_custom/elfeed.org"))
