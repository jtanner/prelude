(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-highlight-search t)
 '(ag-reuse-buffers t)
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(blink-cursor-mode t)
 '(company-dabbrev-code-ignore-case nil)
 '(company-dabbrev-code-modes
   (quote
    (prog-mode batch-file-mode csharp-mode css-mode erlang-mode haskell-mode jde-mode lua-mode python-mode scala-mode coffee-mode web-mode)))
 '(company-dabbrev-downcase nil)
 '(company-dabbrev-ignore-case (quote keep-prefix))
 '(custom-safe-themes
   (quote
    ("cdc7555f0b34ed32eb510be295b6b967526dd8060e5d04ff0dce719af789f8e5" "1e194b1010c026b1401146e24a85e4b7c545276845fc38b8c4b371c8338172ad" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "146d24de1bb61ddfa64062c29b5ff57065552a7c4019bee5d869e938782dfc2a" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(evil-cross-lines t)
 '(evil-symbol-word-search t)
 '(fci-rule-color "#383838")
 '(ido-use-virtual-buffers nil)
 '(indicate-empty-lines t)
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(js2-mode-show-strict-warnings nil)
 '(mouse-wheel-scroll-amount (quote (1 ((shift) . 1) ((control)))))
 '(neo-window-width 40)
 '(org-agenda-files
   (quote
    ("~/Dropbox/org/learning.org" "~/Dropbox/org/spingo-projects.org" "~/Dropbox/org/spingo-work-log.org" "~/Dropbox/org/weekly-review.org" "~/Dropbox/org/projects.org" "~/Dropbox/org/yearly-review.org")))
 '(org-special-ctrl-a/e t)
 '(org-startup-indented t)
 '(org-use-tag-inheritance nil)
 '(projectile-enable-idle-timer nil)
 '(projectile-mode-line
   (quote
    (quote
     (:eval
      (format " Proj[%s]"
              (projectile-project-name))))))
 '(safe-local-variable-values
   (quote
    ((textmate-gf-exclude . "(/|^)(\\.+[^/]+|tmp|log|node_modules)($|/)")
     (js-indent-level . 2)
     (textmate-gf-exclude . "(/|^)(\\.+[^/]+|fixtures|tmp|log|classes|repo|scala-pkg)($|/)|(\\.xcodeproj|\\.nib|\\.framework|\\.app|\\.pbproj|\\.pbxproj|\\.xcode|\\.xcodeproj|\\.bundle|\\.pyc)(/|$)")
     (textmate-gf-exclude . "(/|^)(\\.+[^/]+|target)($|/)|(\\.xcodeproj|\\.nib|\\.framework|\\.app|\\.pbproj|\\.pbxproj|\\.xcode|\\.xcodeproj|\\.bundle|\\.pyc)(/|$)")
     (textmate-gf-exclude . "(/|^)(\\.+[^/]+|data|tmp|log|classes|build|target)($|/)|(\\.xcodeproj|\\.nib|\\.framework|\\.app|\\.pbproj|\\.pbxproj|\\.xcode|\\.xcodeproj|\\.bundle|\\.pyc)(/|$)")
     (textmate-gf-exclude . "(/|^)(\\.+[^/]+|fixtures|tmp|log|classes|build|target)($|/)|(\\.xcodeproj|\\.nib|\\.framework|\\.app|\\.pbproj|\\.pbxproj|\\.xcode|\\.xcodeproj|\\.bundle|\\.pyc)(/|$)")
     (textmate-project-roots ".dir-locals.el"))))
 '(scroll-preserve-screen-position nil)
 '(sh-indentation 2)
 '(sp-autoinsert-if-followed-by-word nil)
 '(tab-always-indent t)
 '(tab-width 2)
 '(text-scale-mode-step 1.1)
 '(user-full-name "Joe Tanner")
 '(user-mail-address "joe.j.tanner@gmail.com")
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
