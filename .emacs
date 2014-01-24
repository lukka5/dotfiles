;; indentation
(setq c-default-style "stroustrup")
(setq tab-stop-list (number-sequence 4 200 4))
;;(setq-default tab-width 4)
(setq c-basic-offset 4)
(setq sgml-basic-offset 4)
(setq-default indent-tabs-mode nil)

;; no backup
(setq make-backup-files nil)

;; minibuffer color
(set-face-foreground 'minibuffer-prompt "white")

;; php mode
;;(add-to-list 'load-path "~/.elisp/")
;;(load "php-mode")
;;(add-to-list 'auto-mode-alist
;;      '("\\.php[34]?\\'\\|\\.phtml\\'" . php-mode))

;; indent region as
;;(defun indent-region-as (other-mode)
;;  (interactive "aMode to use: ")
;;  (save-excursion
;;(let ((old-mode major-mode))
;;  (narrow-to-region (region-beginning) (region-end))
;;  (funcall other-mode)
;;  (indent-region (region-beginning) (region-end) nil)
;;  (funcall old-mode)))
;;  (widen))

;; octave mode
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
            (cons '("\\.m$" . octave-mode) auto-mode-alist))

;; line numbers
;(global-linum-mode 1)
;(setq linum-format
      ;(lambda (line)
        ;(propertize
         ;(format
          ;(let ((w (length
                    ;(number-to-string
                     ;(count-lines (point-min) (point-max))))))
            ;(concat " %"
                    ;(number-to-string w) "d ")) line) 'face 'linum)))

;; solarized-dark color theme
;(require 'color-theme-solarized)
;(color-theme-solarized-dark)

;; highlight trailing whitespaces, tabs, and beyond 80 column lines ;;;;;;;;;;;
(custom-set-faces
   '(my-tab-face            ((((class color)) (:background "grey10"))) t)
   '(my-trailing-space-face ((((class color)) (:background "gray10"))) t)
   '(my-long-line-face ((((class color)) (:background "gray10"))) t))

(add-hook 'font-lock-mode-hook
          (function
            (lambda ()
             (setq font-lock-keywords
                   (append font-lock-keywords
                           '(("\t+" (0 'my-tab-face t))
                             ("^.\\{80,\\}$"(0 'my-long-line-face t))
                             ("[ \t]+$"    (0 'my-trailing-space-face t))))))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


