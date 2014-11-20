(cd "~/")

(server-start)

;; workaround for package download error
;; http://stackoverflow.com/questions/26108655/error-updating-emacs-packages-failed-to-download-gnu-archive
(setq package-check-signature nil)

;; themes
(setq prelude-theme 'deeper-blue)
