;;; .emacs --- Custom configs and packages
;;; Commentary:
;;; Code:


; settings via menus ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; evil-magic doesn't seem to do anything
; evil-search-mode allows retrieval of past searches
; avy faces changes the colors to make avy more legible
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(evil-ex-search-persistent-highlight nil)
 '(evil-magic (quote very-magic))
 '(evil-search-module (quote evil-search))
 '(evil-toggle-key "C-`")
 '(sml/name-width 25))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(avy-lead-face-0 ((t (:background "#5180b3" :foreground "black"))))
 '(avy-lead-face-2 ((t (:background "#f86bf3" :foreground "black"))))
 '(eyebrowse-mode-line-active ((t (:inherit default :background "color-52" :foreground "brightcyan"))))
 '(linum ((t (:background "black" :foreground "#757575")))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; package manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)

; evil-mode
(require 'evil)
(global-evil-leader-mode) ; allows leader key remap (must run before evil)
(evil-mode 1)

; make line numbers look nice
(require 'nlinum)
(global-nlinum-mode 1)
(setq nlinum-format "%d ")

; smooth scrolling mode
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)

; proxy
; start emacs with --insecure to not use https
;(setq url-proxy-services '(("no_proxy" . "work\\.com")
;                           ("http" . "proxy.work.com:911")))

; remap Esc
(setq key-chord-two-keys-delay 0.1)
(key-chord-define evil-insert-state-map "kd" 'evil-normal-state)
(key-chord-mode 1)

; avy
(define-key evil-motion-state-map (kbd "SPC") 'avy-goto-char-2)

; use C-u, C-j and C-k to move page up/down
(define-key evil-normal-state-map (kbd "C-u") (lambda ()
            (interactive)
            (evil-scroll-up nil)))
(define-key evil-normal-state-map (kbd "C-k") (lambda ()
            (interactive)
            (evil-scroll-up nil)))
(define-key evil-normal-state-map (kbd "C-j") (lambda ()
            (interactive)
            (evil-scroll-down nil)))

; remap goto marker
(define-key evil-normal-state-map (kbd "'") 'evil-goto-mark)

; fzf
(define-key evil-normal-state-map (kbd "C-t") 'fzf)

; misc keys
(define-key evil-normal-state-map (kbd "W") 'save-buffer)

; evil leader
(evil-leader/set-leader "s")

; tread _ as part of text-object words in evil mode
(modify-syntax-entry ?_ "w")

; helm ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'helm)
(require 'helm-config)
(require 'helm-grep)

; should make help faster
(setq helm-quick-update t)

; rebind helm prefix
(global-unset-key (kbd "C-x c"))

; rebind tab to run persistent action instead of C-z
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) 
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(setq helm-split-window-in-side-p t ; open helm buffer inside current window
      helm-move-to-line-cycle-in-source t ; cycle sources
      helm-ff-search-library-in-sexp t ; search `require' and `declare-function' sexp.
      helm-scroll-amount 8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

(setq helm-M-x-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t)
(setq helm-recentf-fuzzy-match t)
(setq helm-semantic-fuzzy-match t)
(setq helm-imenu-fuzzy-match t)
(setq helm-locate-fuzzy-match t)
(setq helm-apropos-fuzzy-match t)
(setq helm-lisp-fuzzy-completion t)
(setq helm-file-cache-fuzzy-match t)

; rebind to use helm
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)

(define-key 'help-command (kbd "C-f") 'helm-apropos)
(define-key 'help-command (kbd "r") 'helm-info-emacs)
(define-key 'help-command (kbd "C-l") 'helm-locate-library)

;; show minibuffer history with Helm
(define-key minibuffer-local-map (kbd "M-p") 'helm-minibuffer-history)
(define-key minibuffer-local-map (kbd "M-n") 'helm-minibuffer-history)

(evil-leader/set-key "h a" 'helm-do-ag)
(evil-leader/set-key "h m" 'helm-mini)
(evil-leader/set-key "h f" 'helm-find-files)

; allow helm ag to search symlinks and dotfiles
;; (custom-set-variables
;;   '(helm-ag-base-command "ag --nocolor --nogroup --ignore-case -f --hidden"))

(require 'helm-descbinds)
(helm-descbinds-mode)

(require 'helm-describe-modes)
(global-set-key [remap describe-mode] #'helm-describe-modes)

(require 'helm-fuzzier)
(helm-fuzzier-mode 1)

(helm-autoresize-mode 1)
(helm-mode 1) ; turn on helm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; eyebrowse
(eyebrowse-mode t)
(eyebrowse-setup-opinionated-keys)

; projectile
(projectile-global-mode) ; turn on projectile
(setq projectile-completion-system 'helm)
(setq projectile-enable-caching t) ; refresh: projectile-invalidate-cache
(helm-projectile-on)
(evil-leader/set-key "p f" 'helm-projectile-find-file)
(evil-leader/set-key "p a" 'helm-projectile-ag)

; helm-flx: different sorting algorithm for helm (a little weird)
;; (helm-flx-mode +1)

; remove minor mode clutter from modeline
(require 'rich-minority)
(rich-minority-mode 1)
(setf rm-blacklist "")

; Maximize selected window
(defun evil-set-width-height ()
  (interactive)
  (evil-window-set-height nil)
  (evil-window-set-width nil))
(evil-leader/set-key "o" 'evil-set-width-height)

; smart-mode-line
(setq sml/theme 'dark)
(sml/setup)

; <tab> = tab key
; TAB = tab character
(define-key evil-insert-state-map (kbd "TAB") "    ")
(setq-default indent-tabs-mode nil) ; TAB inserts spaces
;; (setq-default tab-width 4)

; company mode
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay nil) ; only trigger on key-press when "nil"
(define-key evil-insert-state-map (kbd "C-p") 'company-complete)

; remap keys to match vim/helm/emacs
(define-key company-active-map (kbd "C-n")
  (lambda () (interactive) (company-complete-common-or-cycle 1)))
(define-key company-active-map (kbd "C-p")
  (lambda () (interactive) (company-complete-common-or-cycle -1)))

; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

; company-flx
;; (with-eval-after-load 'company
;;   (company-flx-mode +1))

; how does this work?
;; (eval-after-load 'company
;;   '(progn
;;      (define-key company-mode-map (kbd "C-:") 'helm-company)
;;      (define-key company-active-map (kbd "C-:") 'helm-company)))

; rtags ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; seems to work on everything
; flycheck about the same as ycm on cmake source
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/site-lisp/rtags") ; install rtags manually
(require 'rtags)
(setq rtags-autostart-diagnostics t) ; diagnostics used by flycheck
(rtags-diagnostics)
; auto-start rdm when in C/C++ source file (doesn't seem to work if someone else's rdm is running)
(add-hook 'c-mode-common-hook 'rtags-start-process-unless-running)
(add-hook 'c++-mode-common-hook 'rtags-start-process-unless-running)
(evil-leader/set-key "r d" 'rtags-find-symbol-at-point)
(evil-leader/set-key "r r" 'rtags-find-references-at-point)
(evil-leader/set-key "r c" 'rtags-rename-symbol)
(evil-leader/set-key "r p" 'rtags-location-stack-back)
(evil-leader/set-key "r n" 'rtags-location-stack-forward)
(evil-leader/set-key "r s" 'rtags-display-summary)
(evil-leader/set-key "r h" 'rtags-print-class-hierarchy)
(evil-leader/set-key "r v" 'rtags-find-virtuals-at-point)
;; (evil-leader/set-key "r RET" 'rtags-show-in-other-window) ; don't need if using helm
(setq rtags-use-helm t)

; company-rtags
(setq rtags-completions-enabled t)
(push 'company-rtags company-backends)

; flycheck-rtags
(require 'flycheck-rtags)
(defun my-flycheck-rtags-setup ()
  (flycheck-select-checker 'rtags)
  (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
  (setq-local flycheck-check-syntax-automatically nil))
;; c-mode-common-hook is also called by c++-mode
(add-hook 'c-mode-common-hook #'my-flycheck-rtags-setup)
;---------------------------------------------------

; ycmd ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; flycheck seems to work anywhere, ~5 seconds for cmake source
; auto-complete works for smaller projects but fails on cmake source
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'ycmd)
;; (add-hook 'after-init-hook #'global-ycmd-mode)
;; ; This must be the absolute path to the directory containing the __main__.py file
;; (set-variable 'ycmd-server-command '("python" "/home/ctstapl/installed/ycmd/ycmd"))
;; (ycmd-show-debug-info)

; company-ycmd
;; (require 'company-ycmd)
;; (company-ycmd-setup)

; flycheck-ycmd
;; (require 'flycheck-ycmd)
;; (flycheck-ycmd-setup)
;---------------------------------------------------

; irony ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; irony will prompt to build the server when a C++ file is opened
; works ok with simpler projects, but fails on cmake source
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (add-hook 'c++-mode-hook 'irony-mode)
;; (add-hook 'c-mode-hook 'irony-mode)
;; (add-hook 'objc-mode-hook 'irony-mode)
;; ;; replace the `completion-at-point' and `complete-symbol' bindings in
;; ;; irony-mode's buffers by irony-mode's function
;; (defun my-irony-mode-hook ()
;;   (define-key irony-mode-map [remap completion-at-point]
;;     'irony-completion-at-point-async)
;;   (define-key irony-mode-map [remap complete-symbol]
;;     'irony-completion-at-point-async))
;; (add-hook 'irony-mode-hook 'my-irony-mode-hook)
;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; ; company-irony
;; (eval-after-load 'company
;;   '(add-to-list 'company-backends 'company-irony))

;; ; flycheck-irony
;; (eval-after-load 'flycheck
;;   '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
;---------------------------------------------------

; multiple cursors
(require 'evil-multiedit)
(define-key evil-normal-state-map "R" 'evil-multiedit-match-all)
(define-key evil-visual-state-map "R" 'evil-multiedit-match-all)
(define-key evil-motion-state-map "R" 'evil-multiedit-match-all)
;; (define-key evil-normal-state-map (kbd "M-n") 'evil-multiedit-match-and-next)
;; (define-key evil-visual-state-map (kbd "M-n") 'evil-multiedit-match-and-next)
;; (define-key evil-normal-state-map (kbd "M-p") 'evil-multiedit-match-and-prev)
;; (define-key evil-visual-state-map (kbd "M-p") 'evil-multiedit-match-and-prev)
;; (define-key evil-multiedit-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)
;; (define-key evil-visual-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)
;; (define-key evil-multiedit-state-map (kbd "C-n") 'evil-multiedit-next)
;; (define-key evil-multiedit-state-map (kbd "C-p") 'evil-multiedit-prev)
(evil-ex-define-cmd "ie[dit]" 'evil-multiedit-ex-match) ;; example usage: ":%ie mystring"
(evil-leader/set-key "m e" 'evil-multiedit-abort)
(evil-leader/set-key "m r" 'evil-multiedit-restore)

;; ; evil-mc
;; (require 'evil-mc)
;; (global-evil-mc-mode  1)
;; ; Can't use key-chord with evil-mc
;; (define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)
;; ; keys:
;; (define-key evil-normal-state-map (kbd "grm") 'evil-mc-make-all-cursors)
;; (define-key evil-normal-state-map (kbd "gru") 'evil-mc-undo-all-cursors)
;; (define-key evil-normal-state-map (kbd "grs") 'evil-mc-pause-cursors)
;; (define-key evil-normal-state-map (kbd "grr") 'evil-mc-resume-cursors)
;; (define-key evil-normal-state-map (kbd "grf") 'evil-mc-make-and-goto-first-cursor)
;; (define-key evil-normal-state-map (kbd "grl") 'evil-mc-make-and-goto-last-cursor)
;; (define-key evil-normal-state-map (kbd "grh") 'evil-mc-make-cursor-here)
;; (define-key evil-normal-state-map (kbd "M-n") 'evil-mc-make-and-goto-next-cursor)
;; (define-key evil-normal-state-map (kbd "grN") 'evil-mc-skip-and-goto-next-cursor)
;; (define-key evil-normal-state-map (kbd "M-p") 'evil-mc-make-and-goto-prev-cursor)
;; (define-key evil-normal-state-map (kbd "grP") 'evil-mc-skip-and-goto-prev-cursor)
;; (define-key evil-normal-state-map (kbd "C-n") 'evil-mc-make-and-goto-next-match)
;; (define-key evil-normal-state-map (kbd "grn") 'evil-mc-skip-and-goto-next-match)
;; (define-key evil-normal-state-map (kbd "C-p") 'evil-mc-make-and-goto-prev-match)
;; (define-key evil-normal-state-map (kbd "grp") 'evil-mc-skip-and-goto-prev-match)

; misc
(electric-indent-mode -1) ; turn off auto-indent
(menu-bar-mode -1) ; turn off menu bar (useless?)
(visual-line-mode 1) ; better line wrapping
(show-paren-mode t) ; show matching parenthesis
;; (setq gdb-many-windows t) ; graphical GDB
(setq gdb-show-main t) ; show main function on GDB startup
(setq backup-inhibited t) ;disable backup
(setq auto-save-default nil) ;disable auto save
(modify-syntax-entry ?_ "w") ;treat _ as part of word for evil

; remove "kill buffer with live process" :prompt
(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
         kill-buffer-query-functions))

; make vertical divider look nicer
(set-face-background 'vertical-border "black")
(set-face-foreground 'vertical-border (face-background 'vertical-border))

; low threshold = responsive, high threshold = fast
(setq gc-cons-threshold 40000000)

(load-theme 'ample t t)
(load-theme 'ample-flat t t)
(load-theme 'ample-light t t)
(enable-theme 'ample)
;; (load-theme 'monokai t)

;(ediff-split-window-function 'split-window-horizontally) ; ediff vertical split

; don't skip over wrapped lines
;; (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
;; (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

; installed packages ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; evil
; avy
; key-chord
; projectile
; helm
; helm-projectile, helm-flx, helm-company, helm-descbinds, helm-describe-modes, helm-fuzzier
; helm-proc, helm-mode-manager
; smooth-scrolling
; rich-minority
; company
; evil-leader
; eyebrowse
; nlinum
; fzf
; cmake-mode
; flycheck
; ample theme
; smart-mode-line
; command-log-mode
; company-flx
; zoom-window
; evil-multiedit
; evil-mc
; rtags
; ycmd (unused)
; irony, company-irony, flycheck-irony (unused)
; pcre2el

;;; .emacs ends here
