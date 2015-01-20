;; This makes ido-find-file-other-window,
;; ido-switch-buffer-other-window, et. al obsolete. It’s a much better
;; abstraction, and I believe it should become apart of ido mode,
;; because any command that uses ido-completing-read can benefit from
;; it without any additional effort, including textmate.el’s
;; textmate-goto-symbol.


(require 'ido)

(defun split-window-vertically-and-switch ()
  (interactive)
  (split-window-vertically)
  (other-window 1))

(defun split-window-horizontally-and-switch ()
  (interactive)
  (split-window-horizontally)
  (other-window 1))

(defun ido-invoke-in-other-window ()
  "signals ido mode to switch to (or create) another window after exiting"
  (interactive)
  (setq ido-exit-minibuffer-target-window 'other)
  (ido-exit-minibuffer))

(defun ido-invoke-in-horizontal-split ()
  "signals ido mode to split horizontally and switch after exiting"
  (interactive)
  (setq ido-exit-minibuffer-target-window 'horizontal)
  (ido-exit-minibuffer))

(defun ido-invoke-in-vertical-split ()
  "signals ido mode to split vertically and switch after exiting"
  (interactive)
  (setq ido-exit-minibuffer-target-window 'vertical)
  (ido-exit-minibuffer))

(defun ido-invoke-in-new-frame ()
  "signals ido mode to create a new frame after exiting"
  (interactive)
  (setq ido-exit-minibuffer-target-window 'frame)
  (ido-exit-minibuffer))

(defadvice ido-read-internal (around ido-read-internal-with-minibuffer-other-window activate)
  (let* (ido-exit-minibuffer-target-window
         (this-buffer (current-buffer))
         (result ad-do-it))
    (cond
     ((equal ido-exit-minibuffer-target-window 'other)
      (if (= 1 (count-windows))
          (split-window-horizontally-and-switch)
        (other-window 1)))
     ((equal ido-exit-minibuffer-target-window 'horizontal)
      (split-window-horizontally-and-switch))

     ((equal ido-exit-minibuffer-target-window 'vertical)
      (split-window-vertically-and-switch))
     ((equal ido-exit-minibuffer-target-window 'frame)
      (make-frame)))
    (switch-to-buffer this-buffer) ;; why? Some ido commands, such as textmate.el's textmate-goto-symbol don't switch the current buffer
    result))

(defadvice ido-init-completion-maps (after ido-init-completion-maps-with-other-window-keys activate)
  (mapcar (lambda (map)
            (define-key map (kbd "C-o") 'ido-invoke-in-other-window)
            (define-key map (kbd "C-2") 'ido-invoke-in-vertical-split)
            (define-key map (kbd "C-3") 'ido-invoke-in-horizontal-split)
            (define-key map (kbd "C-4") 'ido-invoke-in-other-window)
            (define-key map (kbd "C-5") 'ido-invoke-in-new-frame))
          (list ido-buffer-completion-map
                ido-common-completion-map
                ido-file-completion-map
                ido-file-dir-completion-map)))

;; ibuffer integration
(defvar ido-invoke-ibuffer-buffer-names
  nil
  "a list of buffers that was in the ido list")

(defun ido-invoke-ibuffer-mode-switch ()
  (interactive)
  (let ((filters (format "^\\(%s\\)$" (mapconcat (lambda (buffer-name) (regexp-quote buffer-name))
                                                 ido-invoke-ibuffer-buffer-names
                                                 "\\|")))
        (buffer-name "*ido ibuffer list*")
        (message-log-max))

    (when (get-buffer buffer-name) (kill-buffer buffer-name))
    (ibuffer nil buffer-name)
    (let ((old-msg (current-message)))
      (ibuffer-filter-by-name filters)
      (message "%s" old-msg))))

(defun ido-invoke-ibuffer-mode ()
  (interactive)
  (setq ido-invoke-ibuffer-buffer-names ido-cur-list)
  (setq fallback 'ido-invoke-ibuffer-mode-switch)
  (setq ido-exit 'fallback)
  (ido-exit-minibuffer))

;; (ibuffer nil "test" nil nil nil
;;          (list (list "ido"
;;                      (cons 'name "^\\(ido*\\)\\|textmate"))))

;; (ibuffer nil "test" nil nil nil
;;          '(("ido" (name . "^\\(\\*Messages\\*\\|ido\\.el\\.gz\\|\\*Help\\*\\|inf-ruby\\.el\\|\\*scratch\\*\\|textmate-plus\\.el\\|\\*Completions\\*\\|ido\\.el\\|test\\)$"))))

;; (ibuffer nil "test" nil nil nil
;;          '(("ido" (name . "*scratch*"))))

(defadvice ido-init-completion-maps (after ido-init-completion-maps-with-ibuffer activate)
  (define-key ido-buffer-completion-map (kbd "C-l") 'ido-invoke-ibuffer-mode))

;;
;; Display ido results vertically, rather than horizontally
;;
(prelude-require-package 'ido-vertical-mode)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)
;(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
