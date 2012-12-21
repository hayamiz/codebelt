;; -*- coding: utf-8 -*-

;; Emacsを透明に

(set-frame-parameter nil 'alpha 100) ;; not transparent
(set-frame-parameter nil 'alpha 50) ;; not transparent
(set-frame-parameter nil 'alpha 0) ;; almost fully transparent


;; Toggling
(defvar emacs-transparency-toggle-switch nil)

(defun my-emacs-transparency-toggle ()
  (interactive)
  (if emacs-transparency-toggle-switch
	  (progn
		(setq emacs-transparency-toggle-switch nil)
		(set-frame-parameter nil 'alpha 100))
	(setq emacs-transparency-toggle-switch t)
	(set-frame-parameter nil 'alpha 0)))

(define-key global-map
  (kbd "<f6>")
  'my-emacs-transparency-toggle)
