;; only use tab for indentation!
(require 'yasnippet)
(yas-global-mode 1)

(define-key yas-minor-mode-map [(tab)] nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(global-set-key (kbd "C-:") 'yas-expand)
