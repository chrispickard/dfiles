;; SHOW PAREN MODE CUSTOMIZATION
;; Original version by August Karlstrom
;; https://lists.gnu.org/archive/html/help-gnu-emacs/2005-03/msg00329.html

(defconst my-show-paren-timeout 2
  "*Time in seconds until a matching paren is unhighlighted.")

(defvar my-show-paren-timeout-timer nil
  "*Timer used by advice `timeout' of `show-paren-function'.")

(defvar my-show-paren-timeout-saved-point nil
  "*Location used by advice `timeout' of `show-paren-function'.")

(require 'advice)

(defadvice show-paren-function (after timeout)
  "Unhighlight matching paren after `my-show-paren-timeout' seconds."
  (if (and (integerp my-show-paren-timeout-saved-point)
           (= (point) my-show-paren-timeout-saved-point))
      (progn (delete-overlay show-paren--overlay)
             (delete-overlay show-paren--overlay-1))
    (setq my-show-paren-timeout-saved-point (point))
    (setq my-show-paren-timeout-timer
          (run-with-idle-timer my-show-paren-timeout nil
                               (lambda ()
                                 (when (= (point)
                                          my-show-paren-timeout-saved-point)
                                   (delete-overlay show-paren--overlay)
                                   (delete-overlay show-paren--overlay-1)))))))

(ad-activate 'show-paren-function)
