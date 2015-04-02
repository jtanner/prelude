(defun textmate-delete-to-beginning-of-line ()
  "Delete to the beginning of the line"
  (interactive)
  (let ((p1 (point)))
    (beginning-of-line)
    (filter-buffer-substring p1 (point) t)))

(defun textmate-shift-right (&optional arg)
  "Shift the line or region to the ARG places to the right.
A place is considered `tab-width' character columns."
  (interactive)
  (let ((deactivate-mark nil)
        (beg (or (and mark-active (region-beginning))
                 (line-beginning-position)))
        (end (or (and mark-active (region-end)) (line-end-position))))
    (indent-rigidly beg end (* (or arg 1) tab-width))))

(defun textmate-shift-left (&optional arg)
  "Shift the line or region to the ARG places to the left."
  (interactive)
  (textmate-shift-right (* -1 (or arg 1))))

(global-set-key [(super \])]  'textmate-shift-right)
(global-set-key [(super \[)] 'textmate-shift-left)
(global-set-key (kbd "s-<backspace>") 'textmate-delete-to-beginning-of-line)
