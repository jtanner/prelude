;; ----------------------------------------
;; Require packages that don't need
;; extra configuration.
;; ----------------------------------------
(prelude-require-packages '(ag help-fns+))
(require 'help-fns+)


;; ----------------------------------------
;; Start with org todo
;; ----------------------------------------
(setq initial-buffer-choice "~/Dropbox/org/spingo-work-log.org")
;; (org-agenda nil "a")


;; ----------------------------------------
;;
;; Visual tweaks
;;
;; ----------------------------------------

(scroll-bar-mode -1)

;; font
(set-face-attribute 'default nil :height 150) ;; e.g. 140 == 14pt
(set-default-font "Anonymous Pro")
;; (set-default-font "Droid Sans Mono")

;; set default screen size
(defun set-frame-size-according-to-resolution()
  (interactive)
  (if window-system
      (progn
        ;; when on a larger display than my 15" screen
        (if (> (x-display-pixel-width) 2880)
            (setq default-frame-alist
                  '((left . 0) (width . 238) (height . 68)))
          (setq default-frame-alist
                '((left . 0) (width . 178) (height . 56))))
        )))
(set-frame-size-according-to-resolution)



;; ----------------------------------------
;;
;; Custom mappings
;;
;; ----------------------------------------

;; fast buffer switching
;; (global-set-key (kbd "s-{") 'next-buffer)
;; (global-set-key (kbd "s-}") 'previous-buffer)

;; commenting like other apps
(global-set-key (kbd "s-/") 'evilnc-comment-or-uncomment-lines)

;; opposite of s-'
(global-set-key (kbd "s-\"") 'previous-multiframe-window)

(global-set-key (kbd "s-w") 'delete-window)
(global-set-key (kbd "s-n") nil)

(global-set-key [(super return)] 'prelude-smart-open-line)

;; unset windmove bindings so default S-right will select
(global-set-key [(shift right)] nil)
(global-set-key [(shift left)] nil)

(global-set-key (kbd "s-<right>") 'move-end-of-line)
(global-set-key (kbd "s-<left>") 'move-beginning-of-line)

;; quit with s-q s-q
(define-prefix-command 'global-map)
(global-set-key (kbd "s-q") 'global-map)
(global-set-key (kbd "s-q s-q") 'save-buffers-kill-emacs)

(define-key prelude-mode-map (kbd "s-t") 'projectile-find-file)

(global-set-key (kbd "s-=") 'text-scale-increase)
(global-set-key (kbd "s--") 'text-scale-decrease)
(global-set-key (kbd "s-0") (lambda () (interactive) (text-scale-set 0)))

(global-set-key (kbd "s-y") 'bury-buffer)



;; ----------------------------------------
;;
;; Custom tweaks
;;
;; ----------------------------------------
(remove-hook 'text-mode-hook 'turn-on-auto-fill) ;; what does this do?



;; ----------------------------------------
;;
;; Custom functions
;;
;; ----------------------------------------

;; save all buffers
(defun force-save-all ()
  "Unconditionally saves all unsaved buffers."
  (interactive)
  (save-some-buffers t))
(global-set-key (kbd "M-s-ß") 'force-save-all) ;; option-command-s



;;
;; Scroller: scrolling without moving the cursor
;;
(defun scroll-down-keep-cursor ()
   ;; Scroll the text one line down while keeping the cursor
   (interactive)
   (scroll-down 1))

(defun scroll-up-keep-cursor ()
   ;; Scroll the text one line up while keeping the cursor
   (interactive)
   (scroll-up 1))

(global-set-key (kbd "C-s-<268632080>") 'scroll-down-keep-cursor) ;; control command p
(global-set-key (kbd "C-s-<268632078>") 'scroll-up-keep-cursor) ;; control command n


;;
;; buffers
;;
(defun kill-buffer-and-delete-window ()
  (interactive)
  (kill-this-buffer)
  (unless (= 1 (count-windows)) (delete-window)))

(global-set-key (kbd "s-b") 'switch-to-buffer)
(global-set-key (kbd "C-s-<268632075>") 'kill-buffer-and-delete-window) ;; C-s-k
; disable s-k in prelude-mode so it can be used with kill-this-buffer
(eval-after-load "prelude-mode"
  '(define-key prelude-mode-map (kbd "s-k") nil))


;; copy file path to clipboard
(defun copy-file-path-to-clipboard ()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
      (message filename))))


;; ;; look at kill ring contents
;; (global-set-key "\C-c y" '(lambda ()
;;                            (interactive)
;;                            (popup-menu 'yank-menu)))
