(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(blink-cursor-mode t)
 '(custom-safe-themes
   (quote
    ("1e194b1010c026b1401146e24a85e4b7c545276845fc38b8c4b371c8338172ad" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "146d24de1bb61ddfa64062c29b5ff57065552a7c4019bee5d869e938782dfc2a" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(fci-rule-color "#383838")
 '(ido-use-virtual-buffers t)
 '(indicate-empty-lines t)
 '(mouse-wheel-scroll-amount (quote (1 ((shift) . 1) ((control)))))
 '(projectile-enable-idle-timer nil)
 '(projectile-mode-line
   (quote
    (quote
     (:eval
      (format " Proj[%s]"
              (projectile-project-name))))) t)
 '(safe-local-variable-values
   (quote
    ((js-indent-level . 2)
     (textmate-gf-exclude . "(/|^)(\\.+[^/]+|fixtures|tmp|log|classes|repo|scala-pkg)($|/)|(\\.xcodeproj|\\.nib|\\.framework|\\.app|\\.pbproj|\\.pbxproj|\\.xcode|\\.xcodeproj|\\.bundle|\\.pyc)(/|$)")
     (textmate-gf-exclude . "(/|^)(\\.+[^/]+|target)($|/)|(\\.xcodeproj|\\.nib|\\.framework|\\.app|\\.pbproj|\\.pbxproj|\\.xcode|\\.xcodeproj|\\.bundle|\\.pyc)(/|$)")
     (textmate-gf-exclude . "(/|^)(\\.+[^/]+|data|tmp|log|classes|build|target)($|/)|(\\.xcodeproj|\\.nib|\\.framework|\\.app|\\.pbproj|\\.pbxproj|\\.xcode|\\.xcodeproj|\\.bundle|\\.pyc)(/|$)")
     (textmate-gf-exclude . "(/|^)(\\.+[^/]+|fixtures|tmp|log|classes|build|target)($|/)|(\\.xcodeproj|\\.nib|\\.framework|\\.app|\\.pbproj|\\.pbxproj|\\.xcode|\\.xcodeproj|\\.bundle|\\.pyc)(/|$)")
     (textmate-project-roots ".dir-locals.el"))))
 '(scroll-preserve-screen-position nil)
 '(tab-width 4)
 '(user-full-name "Joe Tanner")
 '(user-mail-address "joe.j.tanner@gmail.com")
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(visible-bell t)
 '(whitespace-line-column 120)
 '(whitespace-style
   (quote
    (face tabs trailing space-before-tab space-after-tab))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight ((t (:background "#043354"))))
 '(region ((t (:background "DodgerBlue3")))))
