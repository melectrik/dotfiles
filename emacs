(package-initialize)

(server-start)

(custom-set-variables
 '(column-number-mode t)
 '(display-battery-mode t)
 '(display-time-mode t)
 '(global-display-line-numbers-mode t)
 '(save-place t)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(x-gtk-show-hidden-files t))

(custom-set-faces)

;;; MT Themes ^
;;; Src: https://github.com/emacs-jp/replace-colorthemes
(add-to-list 'custom-theme-load-path
             (file-name-as-directory "~/emacs/emacs_themes/"))

;; Load your theme
(load-theme 'infodoc t t)
(enable-theme 'infodoc)
;;; MT Themes $

