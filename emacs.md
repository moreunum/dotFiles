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
  * how to remap key? use C-h k then the command
  * did .emacs load? C-h e
  * reload .emacs: eval-buffer
* speed
  * emacs lisp profiler
  * garbage collector threshold
  * turn off autosave?
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
* helm:
  * while using find-file
    * C-j to complete directory
  * while searching buffers:
    * C-j to show buffer in other window
* window layouts
  * perspective:
  * frames
    * create new frame: C-x 5 2
    * cycle frames: C-x 5 o
    * delete frame: C-x 5 0
    * delete all other frames: C-x 5 1
    * how to refresh frame numbers?
  * other ways of saving window layouts (these are probably not as useful as frames)
    * registers
      * C-x r w q = save layout in register "q"
      * C-x r j q = restore layout from register "q"
    * eyebrows: M-0 through M-9, gt, gT
    * winner mode
      * M-x winner mode, C-c <left>, C-c <right>
* company mode
  * M-n, M-p, tab, return
* terminology
  * emacs window = vim split
  * emacs buffer = vim buffer
  * emacs frame = GUI tab (doesnt work in terminal)
* access remote files: tramp
* todo:
  * helm integration with evil?
    * helm with find/locate = similar to fzf
    * helm-ag - how to use this
  * projectile and helm
  * fzf.el (if helm-do-ag is insufficient)
  * place all these commands under a single leader key like spacemacs
  * navigation: 
    * rtags: probably the best
      * company mode code-completion (may not be as good as ycmd or irony)
      * flycheck integration
      * rtags with helm: https://github.com/Andersbakken/rtags/issues/545
        * (setq rtags-use-helm t)
    * cedet: 
      * may not work well with large codebases
      * probably just for C, not C++
    * clang-tags: very similar to rtags, but much fewer contributions...
    * helm-gtags: gnu global tags. does this work well with c++?
    * clang-ctags: like ctags but uses clang
  * syntax checking:
    * flycheck
      * spacemacs layer for reference
  * completion:
    * front-ends:
      * company-mode: seems to be better
      * auto-complete
      * spacemacs auto-completion layer as reference for both
    * rtags: may be sufficient for completion
    * emacs-ycmd = interface to ycm server
      * company-ycmd is the front-end for completion
      * flycheck-ycmd is the front-end for errors
      * spacemacs ycmd layer as example
    * irony-mode
      * works similarly to ycm
      * may stop working after a while
      * may be easier to set up than ycm
      * not fuzzy like ycm
      * c++ only
      * front-end either company or autocomplete
      * errors with flycheck
      * company-irony-backend
      * company-irony-c-headers
    * company-clang
    * company-gtags
  * setup examples:
    * cmake-ide
    * prelude
    * narf emacs
    * spacemacs as reference: packages.el
  * fiplr? helm alternative using grizzl
  * function-args
  * emacs gdb many windows - figure this out
  * emacs-dbgr = other languages
  * magit
  * guide-key
  * smart-mode-line? powerline? spaceline?
    * smart-mode-line can probably replace rich-minority
  * evil-multiedit
  * company quickhelp
  * workgroups2 vs eyebrowse?
  * anzu
  * helm-swoop
  * use-package: organize packages
  * switch evil-leader to bind-map or general.el?
  * replace helm with ivy, swiper and counsel?
  * would which-key be useful?
  * vif: view large files in batches
  * good 256 color theme
