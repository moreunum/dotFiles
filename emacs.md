* exiting:
  * emacs
    * C-x C-c
    * M-x kill-emacs
  * prompt: C-g
  * buffer: C-x k
  * window: q
  * terminal: C-x b RET
* files
  * open: C-x C-f
  * save: C-x C-s
  * save as: C-x C-w
* buffer:
  * open: C-x b
  * list all: C-x C-b
* help
  * what does a command do? C-h k, then the key
  * what does elisp function do? C-h f
  * what does elisp variable do? C-h v
* windows (splits)
  * C-x 1 = close other splits
  * C-x 0 = close particular split
  * C-x o = switch splits
  * C-x 2 or 2 = open splits
* minibuffer: M-x
* eval prompt: M-:
* paste into terminal: shift+insert
* show hidden characters: whitespace-mode
* block comment: M-;
* reload .emacs: load-file
* list active modes: describe-mode
* diff files: ediff
* turn off line wrap: toggle-truncate-lines
* debugging
  * must run gdb-many-windows with -i=mi
* motion
  * scroll down: C-v
  * scroll up: M-v
  * search: C-s
  * select: C-spc
* saving window layouts
  * registers
    * C-x r w q = save layout in register "q"
    * C-x r j q = restore layout from register "q"
  * eyebrows: M-0 through M-9, gt, gT
  * winner mode:
    * M-x winner mode, C-c <left>, C-c <right>
* terminology
  * emacs window = vim split
  * emacs buffer = vim buffer
  * emacs frame = GUI tab (doesnt work in terminal)
* plugins
  * helm
  * projectile
  * rtags
  * completion:
    * not sure: rtags does completion?
    * best: ycm?
    * next best? irony-mode w/ company or auto-complete
    * other: cedet, clang-tags, helm-gtags
  * fiplr? may be obsolete with helm/projectile
  * flycheck? (maybe obsolete by ycm)
  * function-args
  * emacs gdb many windows - figure this out
  * emacs-dbgr = other languages
  * magit
  * guide-key
  * powerline?
  * evil-multiedit
