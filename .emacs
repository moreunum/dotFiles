; package manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)

; evil-mode
(require 'evil)
(evil-mode 1)

; make line numbers look nice
(require 'linum)
(global-linum-mode 1)
(setq linum-format "%d ")

; smooth scrolling mode
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)

; hide the startup message
(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)

; proxy
;(setq url-proxy-services '(("no_proxy" . "work\\.com")
;                           ("http" . "proxy.work.com:911")))

; evil remaps ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; helm
(helm-mode 1) ; turn on helm

; misc
(electric-indent-mode -1) ; turn off auto-indent
(menu-bar-mode -1) ; turn off menu bar (useless?)
(load-theme 'wombat) ; color theme
(visual-line-mode 1) ; better line wrapping
(show-paren-mode t) ; show matching parenthesis
(setq gdb-many-windows t) ; graphical GDB
(setq gdb-show-main t) ; show main function on GDB startup

;(color-theme-approximate-on) ; make colors look correct (doesn't do anything?)

;; (eyebrowse-mode t)
;; (eyebrowse-setup-opinionated-keys)

;(ediff-split-window-function 'split-window-horizontally) ; ediff vertical split

;; (setq indent-tabs-mode nil) ; TAB inserts spaces
;; (setq tab-width 4)
;; (setq c-basic-offset 2)
;; (setq-default tab-width 4 indent-tabs-mode nil)
;; (setq-default c-basic-offset 4 c-default-style "bsd")

; don't skip over wrapped lines
;; (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
;; (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

; installed packages:
; evil
; avy
; key-chord
; smooth-scrolling
; eyebrowse (unused)
; color-theme-approximate (unused)
