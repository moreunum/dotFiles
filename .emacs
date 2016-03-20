; package manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)

; misc
(electric-indent-mode -1) ; turn off auto-indent
(menu-bar-mode -1) ; turn off menu bar (useless?)
(load-theme 'wombat) ; color theme
(visual-line-mode 1) ; better line wrapping

; make line numbers look nice
(require 'linum)
(global-linum-mode 1)
(setq linum-format "%d ")

; evil-mode
(require 'evil)
(evil-mode 1)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (setq indent-tabs-mode nil) ; TAB inserts spaces
;; (setq tab-width 4)
;; (setq c-basic-offset 2)
