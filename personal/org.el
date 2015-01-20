(prelude-require-packages '(evil-org
                            org-bullets
                            org-ac
                            ))

(require 'evil-org)
(require 'org-bullets)
;; (require 'org-ac)
;; (org-ac/config-default)

(setq org-directory "~/Dropbox/org")
(setq org-mobile-inbox-for-pull "~/Dropbox/org/flagged.org")
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

(add-hook 'org-mode-hook (lambda ()
                           (org-bullets-mode 1)
                           (smartparens-mode 1)
                           ;; (company-mode 0)
                           )
          t)

(define-key org-mode-map (kbd "s-.") 'org-narrow-to-subtree)
(define-key org-mode-map (kbd "s-,") 'widen)

(add-to-list 'load-path "~/.emacs.d/vendor/org-gtd/")
(require 'org-gtd)

(setq org-capture-templates
      '(("t" "Inbox entry" entry (file "~/Dropbox/org/inbox.org")
         "* TODO %U %?")
        ("j" "5 minute journal entry" entry (file+datetree "~/Dropbox/org/journal.org")
         "* I am greatful for:\n%?\n* What would make today great?\n* Daily affirmations. I am:\n* 3 good things that happened today:\n* How could I have made today better?")))

(setq org-todo-keywords '((sequence "TODO" "STARTED" "WAITING" "|" "DONE" "CANCELLED" "DEFERRED")))
(setq org-todo-keyword-faces '(("STARTED" . "yellow")))

(setq org-tag-alist '(; Context
                      ("Work"     . ?w)
                      ("Personal" . ?p)
                      ; Project
                      ("ACTIVE"   . ?a)
                      ("HOLD"     . ?h)
                      ("PENDING"  . ?e)
                      ("READING"  . ?r)
                      ; Task
                      ("next"     . ?n)
                      ("later"    . ?l)
                      ("maybe"    . ?m)))
