;;; Greg Kikola
;;; ~/.emacs
;;; 2014-09-13
;;; Updated 2018-10-03

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.
(package-initialize)

;; date and time
(setq display-time-24hr-format t)
(setq calendar-date-style 'iso)
(display-time-mode 1)

;; hide menus and splash screen
(setq inhibit-splash-screen t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; show column numbers
(setq column-number-mode t)

;; use M-p and M-n to scroll one line at a time
(global-set-key (kbd "M-p") (kbd "C-u 1 M-v"))
(global-set-key (kbd "M-n") (kbd "C-u 1 C-v"))

;; tabs
(setq-default indent-tabs-mode nil) ; convert tabs to spaces
(setq-default tab-width 2)

;; treat C-<tab> like <tab>
(global-set-key (kbd "C-<tab>") 'indent-for-tab-command)

;; highlight trailing whitespace
(setq-default show-trailing-whitespace t)
;; but ignore whitespace in calendar
(add-hook 'calendar-initial-window-hook
          (lambda () (setq-local show-trailing-whitespace nil)))
(add-hook 'calendar-initial-window-hook 'redraw-display)

;; put backups in separate directory and use version control
(if (not (file-exists-p "~/.emacs_saves"))
    (make-directory "~/.emacs_saves" t))
(setq backup-directory-alist `(("." . "~/.emacs_saves")))
(setq make-backup-files t
      version-control t
      delete-old-versions t
      kept-old-versions 2
      kept-new-versions 2
      )

;; org-mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-agenda-files '("~/Documents/org"))
(setq org-agenda-include-diary t)
(setq org-agenda-start-day "-1d") ; agenda starts from yesterday
(setq org-agenda-span 14)
(setq org-agenda-start-on-weekday nil)
(setq org-clock-idle-time 10) ; resolve idle time while on the clock
(setq org-todo-keywords '((sequence "TODO" "|" "DONE" "CANCELED")))

;; css-mode
(setq-default css-indent-offset 2)

;; js-mode
(setq-default js-indent-level 2)

;; php-mode
(require 'php-mode nil 'noerror)
(add-hook 'php-mode-hook #'(lambda() (setq c-basic-offset 2)))
(add-hook 'php-mode-hook #'(lambda() (setq show-trailing-whitespace t)))

;; web-mode
(require 'web-mode nil 'noerror)
