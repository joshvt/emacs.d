;; Custom

;;(cd "~/rails_projects/simple_blog")

;;  http://tulrich.com/geekstuff/emacs.html
;; - talks about ctags
;; - dabbrev autocomplate 'M-/'     **** 
;; - Autoformating 'C-M-\'


;; make list buffer list in same window
(global-set-key "\C-x\C-b" 'buffer-menu)
;;(global-set-key "\C-x\C-b" 'ibuffer)

;; yas set expand
(global-set-key (kbd "C-c y") 'yas-expand)

(fset 'run-ruby-region-shell
   "\C-[w\C-xo\C-y\C-m\C-xo")
;;(global-set-key (kbd "C-c r") 'run-ruby-region-shell)

(fset 'run-ruby-region-ansi-term
   "\C-[w\C-xo\C-c\C-j\C-y\C-m\C-c\C-k\C-xo")
(global-set-key (kbd "C-c r") 'run-ruby-region-ansi-term)

(fset 'exec-ruby-shell-cmd
   "\C-[|ruby\C-m\C-x4b*Shell Comm\C-i\C-m\C-xo")
(global-set-key (kbd "C-c u") 'exec-ruby-shell-cmd)


(setq make-backup-files nil)
(setq auto-save-default nil)
(fset 'yes-or-no-p 'y-or-n-p)
(blink-cursor-mode t) ;; bink the cursor
(show-paren-mode 1)  ;; blink curson on opposite paren
(set-face-attribute 'default nil :height 155) ;; set the font size.  device height by 10 to get point size
(tool-bar-mode -1)  ;; turn off the toolbar

;; personal keybindings
;;(global-set-key (kbd "C-x C-b") 'buffer-menu-other-window)  ;; give window focus when listing buffers


;;
;; Emacs nav
;; directory browser geared to termal usage
;; https://code.google.com/p/emacs-nav/
;;
(add-to-list 'load-path "~/.emacs.d/emacs-nav-49/")
(require 'nav)
(nav-disable-overeager-window-splitting)
;; Optional: set up a quick key to toggle nav
(global-set-key [f8] 'nav-toggle)


;;
;; Font and resolution items for OS/X
;;


(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
  (progn
    ;; use 120 char wide window for largeish displays
    ;; and smaller 80 column windows for smaller displays
    ;; pick whatever numbers make sense for you
    (if (> (x-display-pixel-width) 1280)
           (add-to-list 'default-frame-alist (cons 'width 120))
           (add-to-list 'default-frame-alist (cons 'width 80)))
    ;; for the height, subtract a couple hundred pixels
    ;; from the screen height (for panels, menubars and
    ;; whatnot), then divide by the height of a char to
    ;; get the height we want
    (add-to-list 'default-frame-alist 
         (cons 'height (/ (- (x-display-pixel-height) 200)
                             (frame-char-height)))))))

(set-frame-size-according-to-resolution)


;; 
;; Solarized for color scheme
;;    get this from github: https://github.com/sellout/emacs-color-theme-solarized
;;

(add-to-list 'custom-theme-load-path "~/.emacs.d/solarized/")
(load-theme 'solarized-dark t)



;;
;; Rinari
;;
;; Did manual install from git using these instructions http://rinari.rubyforge.org/Basic-Setup.html#Basic-Setup
;;
(add-to-list 'load-path "~/.emacs.d/rinari/")
(require 'rinari)
(setq rinari-tags-file-name "TAGS") ;; in rails proj root> ctags-exuberant -a -e -f TAGS --tag-relative -R app lib vendor

;;;
;;; rhtml-mode
;;;
;;; Did a manual install by downloading from git and placing folder in lisp dir (http://rinari.rubyforge.org/rhtml_002dMode.html#rhtml_002dMode)
;;;

(add-to-list 'load-path "~/.emacs.d/rhtml/")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
     	  (lambda () (rinari-launch)))
;; 
;; TAGs in rinari
;; See http://rinari.rubyforge.org/Navigation.html#Navigation.  Requires installation of ctags-exuberant 
;;    used brew install ctags-exuberant (also in macports)
;; ctags-exuberant -a -e -f TAGS --tag-relative -R app lib vendor spec
;; ctags -a -e -f TAGS --tag-relative -R app lib vendor spec

;; This lets you look-up symbols at the point using M-.
(setq rinari-tags-file-name "TAGS")

;;
;; Add helm.  
;;   Docs are on github: https://github.com/emacs-helm/helm
;;   BUT get the file from http://melpa.milkbox.net/
;;   This lets you do goto-anything completion
;;(add-to-list 'load-path "~/.emacs.d/helm/")
;;(require 'helm-config)


;;
;; Configure filecache to load all files for fast file find
;; http://emacswiki.org/emacs/RubyOnRails
;;   Use this by doing C-X C-f (and again if ido-mode it active) C-TAB and typing filename characters
;; 
;; (require 'filecache)
;; (defun rails-add-proj-to-file-cache (dir)
;;   "Adds all the ruby and rhtml files recursively in the current directory to the file-cache"
;;   (interactive "DAdd directory: ")
;;     (file-cache-clear-cache)
;;     (file-cache-add-directory-recursively dir (regexp-opt (list ".rb" ".rhtml" ".xml" ".js" ".yml")))
;;     (file-cache-delete-file-regexp "\\.svn"))
;; ;; Guesing need to update this with each new project
;; ;;(rails-add-proj-to-file-cache "~/dev/simple_blog/")
;; (rails-add-proj-to-file-cache "~/dev/ticketee")

;;
;; Snippets - yasnippes-rails
;;    clonned yasnippets: git clone https://github.com/capitaomorte/yasnippet

(add-to-list 'load-path "~/.emacs.d/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;; I did this, to add more yasnippents for ruby:
;; ===========================================
;; cloned yasnippets for ruby into ruby mode area
;; in ./emacs.d/yasnippets/ruby-mode
;; git clone https://github.com/bmaland/yasnippet-ruby-mode.git
;; move snippets up to ruby-mode dir
;; yas reload from menu (F10)



;;
;; change this path based on local
(setq exec-path (cons (expand-file-name "/home/vagrant/.rbenv/shims/sass") exec-path))                                                        
                                                                                                                                              
(add-to-list 'load-path (expand-file-name "~/.emacs.d/scss"))                                                                                 
(autoload 'scss-mode "scss-mode")                                                                                                             
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))      
