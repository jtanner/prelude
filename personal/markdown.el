(when (package-installed-p 'markdown-mode)
  (add-to-list 'auto-mode-alist '("\\.md\\.html\\'" . markdown-mode)))
