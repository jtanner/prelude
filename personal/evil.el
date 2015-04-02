(prelude-require-packages '(evil-leader evil-nerd-commenter))

(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)

;; evil leader
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "<SPC>" 'ace-jump-mode
  "p" 'projectile-command-map
  "b" 'projectile-switch-to-buffer
  ;; "f" 'projectile-find-file
  ;; "g" 'projectile-vc
  ;; "l" 'ace-jump-line-mode
  ;; "o" 'org-capture
  "s" 'ag-project-regexp
  "k" 'kill-buffer
  "y" 'bury-buffer)

(evil-leader/set-key-for-mode 'scala-mode
  "e" 'ensime)

;; remove evil bindings
(define-key evil-insert-state-map "\C-y" nil)
(define-key evil-insert-state-map "\C-e" nil)
(define-key evil-insert-state-map "\C-k" nil)
(define-key evil-insert-state-map "\C-n" nil)
(define-key evil-insert-state-map "\C-p" nil)
(define-key evil-insert-state-map "\C-d" nil)
(define-key evil-normal-state-map (kbd "M-.") nil)
(define-key evil-normal-state-map "\C-a" nil)
(define-key evil-normal-state-map (kbd "TAB") nil) ;; only use tab for indentation!
(define-key evil-motion-state-map "\C-i" nil)
(define-key evil-motion-state-map "\C-e" nil)
(define-key evil-motion-state-map "\C-y" nil)

(define-key evil-normal-state-map "\C-i" 'evil-jump-forward)
;; (define-key evil-normal-state-map "\C-u" 'evil-scroll-up)
;; (define-key evil-insert-state-map [(return)] 'evil-ret-and-indent) ;; messes with coffee mode indent

;; warning: these cause "dj" (delete this and the next line) to not work
;; (define-key evil-motion-state-map "j" 'evil-next-visual-line) ; gj
;; (define-key evil-motion-state-map "k" 'evil-previous-visual-line) ; gk

;; (global-set-key (kbd "C-]") 'evil-find-char)
;; (global-set-key (kbd "C-M-]") 'evil-find-char-backward)

;; don't start with evil for these modes
(mapc (lambda (e) (add-to-list 'evil-emacs-state-modes e))
      '(ag-mode
        ensime-popup-buffer-mode
        ensime-inspector-mode
        git-commit-mode
        neotree-mode))
(mapc (lambda (e) (add-to-list 'evil-insert-state-modes e))
      '(git-commit-mode))


;; Alternative to ESC
;; use jj and kk to ESC
;;
;; modified from: https://github.com/cofi/dotfiles/blob/master/emacs.d/cofi-evil.el
(evil-define-command evil-maybe-exit-j ()
  :repeat change
  (interactive)
  (evil-maybe-exit ?j))
(evil-define-command evil-maybe-exit-k ()
  :repeat change
  (interactive)
  (evil-maybe-exit ?k))
(evil-define-command evil-maybe-exit (key)
  (let ((modified (buffer-modified-p)))
    (insert key)
    (let ((evt (read-event nil nil 1.0)))
      (cond
       ((null evt) (message ""))
       ((and (integerp evt) (char-equal evt key))
        (delete-char -1)
        (set-buffer-modified-p modified)
        (push 'escape unread-command-events))
       (t (push evt unread-command-events))))))
(define-key evil-insert-state-map "j" 'evil-maybe-exit-j)
(define-key evil-insert-state-map "k" 'evil-maybe-exit-k)


;; Disable Emacs Evil selection auto-copies to clipboard
;; http://stackoverflow.com/questions/17127009/how-to-disable-emacs-evil-selection-auto-copies-to-clipboard
(setq x-select-enable-clipboard nil)
(defun evil-visual-update-x-selection (&optional buffer)
  "Update the X selection with the current visual region."
  (let ((buf (or buffer (current-buffer))))
    (when (buffer-live-p buf)
      (with-current-buffer buf
        (when (and (evil-visual-state-p)
                   (fboundp 'x-select-text)
                   (or (not (boundp 'ns-initialized))
                       (with-no-warnings ns-initialized))
                   (not (eq evil-visual-selection 'block)))
          ;; CHANGE
          ;; ONLY call x-select-text if x-select-enable-clipboard is true
          (if x-select-enable-clipboard
              (x-select-text (buffer-substring-no-properties
                              evil-visual-beginning
                              evil-visual-end))))))))

;;; This is nice, but also annoying
;; ;; Make evil respect _ and - when using for example `viw'
;; (defun forward-evil-word (&optional count)
;;   ""
;;   (let ((init-point (point)))
;;     (forward-symbol (or count 1))

;;     (if (= (point) init-point)
;;         count 0)))
