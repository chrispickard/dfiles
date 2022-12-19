;;; ~/.config/doom/packages.el

(package! doom-snippets
  :recipe (:local-repo "~/projects/conf/doom-snippets"
           :files ("*.el" "snippets")
           :build (:not compile)))

;; (package! doom-themer
;;   :recipe (:local-repo "~/projects/plugins/emacs-doom-themer/"))
;; (package! doom-themes
;;   :recipe (:local-repo "~/projects/plugins/emacs-doom-themes/"
;;            :files ("*.el" "themes/*.el" "extensions/*.el")))