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
