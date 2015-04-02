(prelude-require-packages '(smart-mode-line))

(sml/setup)
(sml/apply-theme 'dark)
(add-to-list 'sml/replacer-regexp-list '("~/spingo/" ":SG:") t)
