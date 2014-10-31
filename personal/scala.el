(require 'prelude-programming)

(prelude-require-package 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
