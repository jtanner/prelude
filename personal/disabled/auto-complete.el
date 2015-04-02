(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-start 2
      ac-delay 0.
      ac-quick-help-delay 1.
      ac-use-fuzzy t
      ac-fuzzy-enable t
      ac-dwim t)
(global-auto-complete-mode t)
(global-set-key (kbd "C-;") 'auto-complete)
