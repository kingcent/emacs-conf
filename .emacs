(setenv "HOME" "D:/emacs-24.3-bin-i386")
(setenv "PATH" "D:/emacs-24.3-bin-i386")
;;set the default file path
(setq default-directory "~/")

(set-language-environment 'UTF-8) 
(set-locale-environment "UTF-8") 

;;org-mode
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-hide-leading-stars t)
(setq org-logde>de>de>de>-done t)

;;show line number
;'(global-linum-mode t)
(global-linum-mode 1) ; always show line numbers
;(setq linum-format "%d| ")  ;set format  

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(case-fold-search nil)
 '(org-agenda-files (quote ("d:/emacs-24.3-bin-i386/org/test.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path "d:/emacs-24.3-bin-i386/.emacs.d/color-theme-6.6.0/")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-gnome2)))

;;evil
(add-to-list 'load-path "d:/emacs-24.3-bin-i386/.emacs.d/evil/")
(require 'evil)
(evil-mode 1)

;;set font family 
;(set-default-font "-outline-consolas-normal-r-normal-normal-14-97-96-96-c-*-iso8859-1")

;; Chinese Font
;(dolist 
;    (charset '(kana han symbol cjk-misc bopomofo))
;    (set-fontset-font (frame-parameter nil 'font)
;       charset (font-spec :family "WenQuanYi Zen Hei Mono" :size 14)
;    )
;)

;(setq face-font-rescale-alist '(("Microsoft Yahei" . 1.2) ("WenQuanYi Zen Hei" . 1.2)))
;(set-face-attribute 'default nil :font "Monaco 8") 
(set-face-attribute 'default nil :font "-outline-consolas-normal-r-normal-normal-14-97-96-96-c-*-iso8859-1") 
(dolist (character '(han kana symbol cjk-misc bopomofo)) 
(set-fontset-font (frame-parameter nil 'font) 
character 
(font-spec :family "Microsoft YaHei" :size 13))) 


;;===for org gtd===start====
;;refer to this page:http://blog.chinaunix.net/uid-26185912-id-3317793.html
(require 'remember)
(require 'org-remember)
(global-set-key "\C-cc" 'remember)
(setq GTD_PATH "e:/kuaipan/emacs-files/gtd/")

(org-remember-insinuate)
(setq org-directory GTD_PATH)
(setq org-remember-templates '(
("Task" ?t "** TODO %? %t\n %i\n %a" (concat GTD_PATH "inbox.org") "Tasks")
("Book" ?c "** %? %t\n %i\n %a" (concat GTD_PATH "inbox.org") "Book")
("Calendar" ?c "** %? %t\n %i\n %a" (concat GTD_PATH "inbox.org") "Calender")
("Project" ?p "** %? %t\n %i\n %a" (concat GTD_PATH "inbox.org") "Project")))
(setq org-default-notes-file (concat org-directory "inbox.org"))
;;设置TODO关键字
(setq org-todo-keywords
(list "TODO(t)" "|" "CANCELED(c)" "DONE(d)"))
;; 将项目转接在各文件之间，方便清理和回顾。
(custom-set-variables
'(org-refile-targets
(quote
(("inbox.org" :level . 1)("canceled.org" :level . 1) ("finished.org":level . 1))
)))
;; 快速打开inbox
(defun inbox() (interactive) (find-file (concat GTD_PATH "inbox.org")))
(global-set-key "\C-cz" 'inbox)
;; 快速启动 agenda-view
(define-key global-map "\C-ca" 'org-agenda-list)
(define-key global-map "\C-ct" 'org-todo-list)
(define-key global-map "\C-cm" 'org-tags-view)
;;显示他们的内容
(setq org-agenda-files
(list (concat GTD_PATH "inbox.org")
      (concat GTD_PATH "inbox.org")
      (concat GTD_PATH "finished.org")
)

