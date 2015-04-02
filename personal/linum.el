(prelude-require-package 'linum)
;;(setq linum-format " %3d")
;;(global-set-key (kbd "M-n") 'linum-mode)

;; install hooks for various langauges to automatically turn on line numbers
(defun turn-on-linum-mode () (linum-mode 1))
(setq linum-modes
      '(emacs-lisp-mode
        clojure-mode
        scheme-mode
        sql-mode
        R-mode
        org-mode
        ruby-mode
        html-mode
        yaml-mode
        sass-mode
        js2-mode
        json-mode
        coffee-mode
        espresso-mode
        scala-mode
        scss-mode
        makefile-mode
        feature-mode
        web-mode))
(dolist (mode linum-modes)
  (add-hook (intern (concat (symbol-name mode) "-hook")) 'turn-on-linum-mode))
