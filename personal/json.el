(when (package-installed-p 'json-mode)
  (add-to-list 'auto-mode-alist '("\\.json\\.template\\'" . json-mode)))
