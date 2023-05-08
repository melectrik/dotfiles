;;; gnus ?
;http://kflu.github.io/2021/05/18/2021-05-18-gnus--imap--gmail--etc/
;https://www.gnu.org/software/emacs/manual/html_mono/emacs.html#Mail-Sending
;https://www.gnu.org/software/emacs/manual/html_mono/smtpmail.html#How-Mail-Works
;(setq send-mail-function 'smtpmail-send-it)
;(setq smtpmail-smtp-server "imap.gmail.com") "smtp.gmail.com"
;(setq smtpmail-smtp-service 587)
;;;

(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(server-start)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-insert (quote other))
 '(auto-insert-alist
   (quote
    ((("\\.\\([Hh]\\|hh\\|hpp\\)\\'" . "C / C++ header")
      .
      ["template.h" c++-mode my/autoinsert-yas-expand])
     (("\\.\\([C]\\|cc\\|cpp\\)\\'" . "C++ source")
      .
      ["template.cc" my/autoinsert-yas-expand])
     (("\\.sh\\'" . "Shell script")
      .
      ["template.sh" my/autoinsert-yas-expand])
     (("\\.el\\'" . "Emacs Lisp")
      .
      ["template.el" my/autoinsert-yas-expand])
     (("\\.pl\\'" . "Perl script")
      .
      ["template.pl" my/autoinsert-yas-expand])
     (("\\.pm\\'" . "Perl module")
      .
      ["template.pm" my/autoinsert-yas-expand])
     (("\\.py\\'" . "Python script")
      .
      ["template.py" my/autoinsert-yas-expand])
     (("[mM]akefile\\'" . "Makefile")
      .
      ["Makefile" my/autoinsert-yas-expand])
     (("\\.tex\\'" . "TeX/LaTeX")
      .
      ["template.tex" my/autoinsert-yas-expand]))))
 '(auto-insert-directory "~/autoinsert/")
 '(column-number-mode t)
 '(display-battery-mode t)
 '(display-time-mode t)
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   (quote
    (yasnippet-snippets yasnippet yaml-mode yaml poly-ansible ansible-vault ansible-doc ansible hcl-mode lua-mode ## redtick)))
 '(save-place t)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(x-gtk-show-hidden-files t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; MT Themes ^
;;; Src: https://github.com/emacs-jp/replace-colorthemes
(add-to-list 'custom-theme-load-path
             (file-name-as-directory "~/dotfiles/dotconfig/emacs/emacs_themes/"))

;; Load your theme
;;;; (load-theme 'infodoc t t)
;;;; (enable-theme 'infodoc)
;;; MT Themes $

(autoload 'auto-make-header "lisp/header2")
(add-hook 'emacs-lisp-mode-hook 'auto-make-header)
(add-hook 'c-mode-common-hook 'auto-make-header)
(add-hook 'shell-script-mode 'auto-make-header)

;;; ^
;;; Andere Möglichkeit
;;; Ref.: https://www.emacswiki.org/emacs/AutoInsertMode
;;; Ref.: https://www.youtube.com/watch?v=ZCGmZK4V7Sg
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

    (defun my/autoinsert-yas-expand()
      "Replace text in yasnippet template."
      (yas/expand-snippet (buffer-string) (point-min) (point-max)))

    (custom-set-variables
     '(auto-insert 'other)
     '(auto-insert-directory "~/.emacs.d/headers/")
     '(auto-insert-alist '((("\\.\\([Hh]\\|hh\\|hpp\\)\\'" . "C / C++ header") . ["template.h" c++-mode my/autoinsert-yas-expand])
                           (("\\.\\([C]\\|cc\\|cpp\\)\\'" . "C++ source") . ["template.cc" my/autoinsert-yas-expand])
                           (("\\.sh\\'" . "Shell script") . ["template.sh" my/autoinsert-yas-expand])
                           (("\\.el\\'" . "Emacs Lisp") . ["template.el" my/autoinsert-yas-expand])
                           (("\\.pl\\'" . "Perl script") . ["template.pl" my/autoinsert-yas-expand])
                           (("\\.pm\\'" . "Perl module") . ["template.pm" my/autoinsert-yas-expand])
                           (("\\.py\\'" . "Python script") . ["template.py" my/autoinsert-yas-expand])
                           (("[mM]akefile\\'" . "Makefile") . ["Makefile" my/autoinsert-yas-expand])
                           (("\\.tex\\'" . "TeX/LaTeX") . ["template.tex" my/autoinsert-yas-expand]))))
;;; $

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

(add-hook 'yaml-mode-hook
      (lambda ()
          (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

