;; init.el --- lyndsey's emacs config

;; Turn off mouse wheel interface to accomodate cheeky Apple mouse
(when window-system
  (mouse-wheel-mode -1))

;; Byebye splash screen
(setq inhibit-splash-screen t)

;;----------------------------------------------------------------------------
;;-- package initialization
;;----------------------------------------------------------------------------

<<<<<<< HEAD
;; Help emacs find node
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setq exec-path
      '(
	"/usr/local/bin"
	"/usr/bin"
	    ))
=======
;; online?
(setq my-onlinep nil)
(unless
    (condition-case nil
        (delete-process
         (make-network-process
          :name "my-check-internet"
          :host "elpa.gnu.org"
          :service 80))
    (error t))
  (setq my-onlinep t))
>>>>>>> 39b4b28306b3ab5ab8010fcfc4a1983a0e5f5237

;; MEPLA and Marmalade
(require 'package)
(setq package-user-dir "~/.emacs.d/elpa/")
(add-to-list 'package-archives
<<<<<<< HEAD
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
=======
	          '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	          '("marmalade" . "http://marmalade-repo.org/packages/") t)
>>>>>>> 39b4b28306b3ab5ab8010fcfc4a1983a0e5f5237
(package-initialize)

(when my-onlinep
(when (not package-archive-contents)
<<<<<<< HEAD
    (package-refresh-contents))


;;----------------------------------------------------------------------------
;;-- packages.list
;;----------------------------------------------------------------------------

(defvar ly/packages
  '(;; language modes
    clojure-mode
    markdown-mode
    web-mode
    js2-mode
    
    ;; autocompletion
    auto-complete
    ac-js2
    
    ;; visual indicator for long lines
    column-marker

    ;; ☆ magical interface☆ for Git through Emacs
    magit

    ;; nested delimiters (parens, brackets, etc.) are colored differently
    rainbow-delimiters))

(defun ly/install-packages ()
  "install uninstalled packages"
  (interactive)
  (dolist (p ly/packages)
    (when (not (package-installed-p p))
      (package-install p))))

(ly/install-packages)

;;----------------------------------------------------------------------------
;;-- general config
;;---------------------------------------------------------------------------- 

;; theme
;; (load-theme 'deeper-blue t)

;; set all coding systems to utf-8
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;----------------------------------------------------------------------------
;;-- custom emacs behavioral settings and overrides
;;----------------------------------------------------------------------------

;; turn off alert bell so I don't drive Nadine crazy
(setq visible-bell t)

;; for the love of everything stop switching between y/n and yes/no prompt
(fset 'yes-or-no-p 'y-or-n-p)

=======
    (package-refresh-contents)))

;;----------------------------------------------------------------------------
;;-- packages.list
;;----------------------------------------------------------------------------

(defvar ly/packages
  '(;; language modes
    clojure-mode
    php-mode
    markdown-mode
    web-mode
    jade-mode

    ;; visual indicator for long lines
    column-marker

    ;; ☆ magical interface☆ for Git through Emacs
    magit

    ;; snipping tool
    yasnippet

    ;; php support in yasnippet
    php-auto-yasnippets
    
    ;; nested delimiters (parens, brackets, etc.) are colored differently
    rainbow-delimiters))

(defun ly/install-packages ()
  "install uninstalled packages"
  (interactive)
  (dolist (p ly/packages)
    (when (not (package-installed-p p))
      (package-install p))))

(ly/install-packages)

;;----------------------------------------------------------------------------
;;-- general config
;;----------------------------------------------------------------------------

;; theme
(load-theme 'deeper-blue t)

;; set all coding systems to utf-8
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;----------------------------------------------------------------------------
;;-- custom emacs behavioral settings and overrides
;;----------------------------------------------------------------------------

;; turn off alert bell so I don't drive Nadine crazy
(setq visible-bell t)

;; for the love of everything stop switching between y/n and yes/no prompt
(fset 'yes-or-no-p 'y-or-n-p)

>>>>>>> 39b4b28306b3ab5ab8010fcfc4a1983a0e5f5237
;; display column number
(setq column-number-mode t)

;; scratch buffer text should not be small novel
(setq initial-scratch-message ";; scratch
")

;; underline matching parentheses when the cursor highlights 'em
(show-paren-mode 1)
(setq-default show-paren-style 'parentheses)
(set-face-attribute 'show-paren-match-face nil
<<<<<<< HEAD
		    :weight 'bold
		    :underline nil
		    :background nil
		    :foreground nil
		    :inverse-video t)

;; emacs, put these.files~ somewhere else
(setq backup-directory-alist `(("." . ,(expand-file-name "~/.emacs.d/backups/"))))

;; and #these.files#, while you're at it
(setq auto-save-file-name-transforms
            `((".*" ,(expand-file-name "~/.emacs.d/backups/"))))
=======
    :weight 'bold
    :underline nil
    :background nil
    :foreground nil
    :inverse-video t)

;; emacs, put these.files~ somewhere else
(setq backup-directory-alist `(("." . ,(expand-file-name "~/.emacs.d/backup/"))))

;; and #these.files#, while you're at it
(setq auto-save-file-name-transforms
            `((".*" ,(expand-file-name "~/.emacs.d/backup/"))))
>>>>>>> 39b4b28306b3ab5ab8010fcfc4a1983a0e5f5237

;;----------------------------------------------------------------------------
;;-- package-specific hooks and custom variables
;;----------------------------------------------------------------------------

;; highlight column 80
(add-hook 'prog-mode-hook (lambda () (interactive) (column-marker-1 80)))

<<<<<<< HEAD
;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

=======
>>>>>>> 39b4b28306b3ab5ab8010fcfc4a1983a0e5f5237
;; add keybindings for multiple-cursors
(global-set-key (kbd "C-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; web mode for n filetypes: because sometimes your html... isn't
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.handlebars\\'" . web-mode))

;; look under your chairs!! rainbow-delimiters for everyone!!!!
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; do after x is loaded
(defmacro after (mode &rest body)
  `(eval-after-load ,mode
<<<<<<< HEAD
     '(progn ,@body)))
=======
          '(progn ,@body)))

;; yas please
(yas-global-mode 1)
>>>>>>> 39b4b28306b3ab5ab8010fcfc4a1983a0e5f5237

;; set rainbow-delimiters colors to complement theme arbitrarily
(defun dynamic-delimiters ()
  (setq delimiter-faces '(rainbow-delimiters-depth-1-face
			  rainbow-delimiters-depth-2-face
			  rainbow-delimiters-depth-3-face))
  (setq theme-faces '(font-lock-builtin-face
		      font-lock-constant-face
		      font-lock-type-face))
  (while delimiter-faces
    (set-face-attribute (car delimiter-faces) nil
			:inherit (car theme-faces))
    (setq delimiter-faces (cdr delimiter-faces))
    (setq theme-faces (append (cdr theme-faces)(cons (car theme-faces)())))))

(after 'rainbow-delimiters (dynamic-delimiters))
