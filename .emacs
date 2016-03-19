; package manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)

; misc
(electric-indent-mode -1) ; turn off auto-indent
(menu-bar-mode -1) ; turn off menu bar (useless?)
(load-theme 'wombat)

; make line numbers look nice
(require 'linum)
(global-linum-mode 1)
(setq linum-format "%d ")

; evil-mode
(require 'evil)
(evil-mode 1)

; pro
;(setq url-proxy-services '(("no_proxy" . "work\\.com")
;                           ("http" . "proxy.work.com:911")))

; evil remaps ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; remap Esc
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "kd" 'evil-normal-state)
(key-chord-mode 1)

; avy
(define-key evil-motion-state-map (kbd "SPC") 'avy-goto-char-2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
