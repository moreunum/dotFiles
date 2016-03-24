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

; use C-j and C-k to move page up/down
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

; evil leader
(evil-leader/set-leader "s")
(evil-leader/set-key "w" 'save-buffer)

; helm ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'helm)
(require 'helm-config)
(require 'helm-grep)

; should make help faster
(setq helm-quick-update t)

; rebind helm prefix
(global-set-key (kbd "C-c h") 'helm-command-prefix)
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
(global-set-key (kbd "C-c h o") 'helm-occur)

(global-set-key (kbd "C-c h x") 'helm-register)

(define-key 'help-command (kbd "C-f") 'helm-apropos)
(define-key 'help-command (kbd "r") 'helm-info-emacs)
(define-key 'help-command (kbd "C-l") 'helm-locate-library)

;; show minibuffer history with Helm
(define-key minibuffer-local-map (kbd "M-p") 'helm-minibuffer-history)
(define-key minibuffer-local-map (kbd "M-n") 'helm-minibuffer-history)

(evil-leader/set-key "h a" 'helm-do-ag)

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

; company mode
(require 'company)
;; (add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay nil) ; only trigger on key-press when "nil"

; remap keys to match vim/helm/emacs
(define-key company-active-map (kbd "C-n")
  (lambda () (interactive) (company-complete-common-or-cycle 1)))
(define-key company-active-map (kbd "C-p")
  (lambda () (interactive) (company-complete-common-or-cycle -1)))

; company-flx
(with-eval-after-load 'company
  (company-flx-mode +1))

; how does this work?
;; (eval-after-load 'company
;;   '(progn
;;      (define-key company-mode-map (kbd "C-:") 'helm-company)
;;      (define-key company-active-map (kbd "C-:") 'helm-company)))

; rtags
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
;; (evil-leader/set-key "r RET" 'rtags-show-in-other-window) ; don't need if using helm
(setq rtags-use-helm t)

; company-rtags
(setq rtags-completions-enabled t)
(push 'company-rtags company-backends)
(global-company-mode)
(define-key evil-insert-state-map (kbd "C-p") 'company-complete)

; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

; flycheck-rtags
(require 'flycheck-rtags)
(defun my-flycheck-rtags-setup ()
  (flycheck-select-checker 'rtags))
;; c-mode-common-hook is also called by c++-mode
(add-hook 'c-mode-common-hook #'my-flycheck-rtags-setup)

; zoom-window: maximize/minimize a window like tmux
(require 'zoom-window)
(evil-leader/set-key "o" 'zoom-window-zoom)
(setq zoom-window-mode-line-color "DarkGreen")

; <tab> = tab key
; TAB = tab character
(define-key evil-insert-state-map (kbd "TAB") "    ")
(setq-default indent-tabs-mode nil) ; TAB inserts spaces
;; (setq-default tab-width 4)

; misc
(electric-indent-mode -1) ; turn off auto-indent
(menu-bar-mode -1) ; turn off menu bar (useless?)
(visual-line-mode 1) ; better line wrapping
(show-paren-mode t) ; show matching parenthesis
;; (setq gdb-many-windows t) ; graphical GDB
(setq gdb-show-main t) ; show main function on GDB startup
(setq backup-inhibited t) ;disable backup
(setq auto-save-default nil) ;disable auto save

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

;; (color-theme-approximate-on) ; make colors look correct (doesn't do anything?)

;(ediff-split-window-function 'split-window-horizontally) ; ediff vertical split

; don't skip over wrapped lines
;; (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
;; (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

; smart-mode-line
;; (setq sml/theme 'dark)
;; (sml/setup)
;; (add-hook 'after-init-hook 'sml/setup)

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
 '(evil-magic (quote very-magic))
 '(evil-search-module (quote evil-search)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(avy-lead-face-0 ((t (:background "#5180b3" :foreground "black"))))
 '(avy-lead-face-2 ((t (:background "#f86bf3" :foreground "black"))))
 '(eyebrowse-mode-line-active ((t (:inherit default :background "color-52" :foreground "brightcyan")))))
