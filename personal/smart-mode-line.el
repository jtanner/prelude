(prelude-require-packages '(smart-mode-line))

(sml/setup)
(sml/apply-theme 'dark)

(customize-set-variable sml/use-projectile-p (quote before-prefixes))
