(prelude-require-packages '(scala-mode2 ensime))
(require 'scala-mode2)
(require 'ensime)

(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(load-file "~/.emacs.d/vendor/scala-plus/scala-plus.el")
(require 'scala-plus)

(defun my-scala-mode-hook ()
  ;; better for evil-mode
  (subword-mode -1)
  ;; only use tab for indentation!
  (define-key scala-mode-map (kbd "TAB") nil)
  (define-key scala-mode-map [(tab)] nil)
  )
(add-hook 'scala-mode-hook 'my-scala-mode-hook t)

;; (setq ensime-completion-style (quote auto-complete))

(defun scala-file-summary ()
  (interactive)
  (let ((regex (if (string-match "Spec$" (file-name-base))
                   "^ *\\(class\\|it\\|describe\\)"
                 "^ *\\(private \\|protected \\|implicit \\|lazy \\)?\\(class\\|object\\|trait\\|def\\)")))
    (occur regex)))

(define-key scala-mode-map (kbd "C-c C-s") 'scala-file-summary)
(define-key scala-mode-map (kbd "s-R") 'scala-plus:yank-sbt-test-only)
