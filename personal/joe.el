;; ----------------------------------------
;; Require packages that don't need
;; extra configuration.
;; ----------------------------------------
(prelude-require-packages '(ag))


;; ----------------------------------------
;; Start with org todo
;; ----------------------------------------
;; (setq initial-buffer-choice "~/org/work.org")


;; ----------------------------------------
;;
;; Visual tweaks
;;
;; ----------------------------------------

(scroll-bar-mode -1)

(prelude-require-packages '(solarized-theme cyberpunk-theme))
;; (load-theme 'solarized-dark t)
(load-theme 'deeper-blue t)
;; (load-theme 'cyberpunk t)

;; font
;; (set-face-attribute 'default nil :height 140) ;; 14pt
;; (set-default-font "Anonymous Pro")

;; set default screen size
(defun set-frame-size-according-to-resolution()
  (interactive)
  (if window-system
      (progn
        ;; when on a larger display than my 15" screen
        (if (> (x-display-pixel-width) 2880)
            (setq default-frame-alist
                  '((left . 80) (width . 223) (height . 63)))
          (setq default-frame-alist
                '((left . 0) (width . 200) (height . 56))))
        )))
(set-frame-size-according-to-resolution)

(setq prelude-flyspell nil)



;; ----------------------------------------
;;
;; Custom mappings
;;
;; ----------------------------------------

;; fast buffer switching
;; (global-set-key (kbd "s-{") 'next-buffer)
;; (global-set-key (kbd "s-}") 'previous-buffer)

;; commenting like other apps
(eval-after-load "prelude-mode"
  '(define-key prelude-mode-map (kbd "s-/") nil))
(global-set-key (kbd "s-/") 'comment-dwim)

;; (eval-after-load "evil-mode"
;;   '(define-key evil-insert-state-map "RET" nil))
;; (define-key evil-insert-state-map "RET" 'evil-ret-and-indent)




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
