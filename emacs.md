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
* switch to the shell: C-x z
* help
  * C-h h = show all "C-h" help commands
  * what does elisp function do? C-h f
  * what is the value/purpose of a variable? C-h v
  * what does key do? use C-h k then the command
  * did .emacs load? C-h e
  * reload .emacs: eval-buffer
  * list active modes: describe-mode (C-h m)
  * command-log-mode: 
    * clm/open-command-log-buffer = open the buffer
    * command-log-mode   = start logging
* enter customization menu: M-x "customize"
* elisp
    * eval prompt: M-:
    * find-function
    * describe-variable
    * functions that look like this: "bh/my-function"
      * the "bh/" is just best practice to avoid function name conflicts with other packages
    * "#'" = "sharp quote" = (function my-function)
    * when creating function, use (interactive) if you want the function to be callable from a key command, or from M-:
    * face = font/color of text
    * symbols with colons ":mysymbol" are keywords that cannot be re-bound
    * cons: construct a list
    * car: first item
    * cdr: the other items
* speed
  * emacs lisp profiler
  * garbage collector threshold
* windows (splits)
  * C-x 1 = close other splits
  * C-x 0 = close particular split
  * C-x o = switch splits
  * C-x 2 or 2 = open splits
* paste into terminal: shift+insert
* show hidden characters: whitespace-mode
* turn off line wrap: toggle-truncate-lines
* block comment: M-;
* reload .emacs: load-file
* diff files: ediff
* debugging
  * use gud-gdb, "gdb" is probably only useful in GUI mode
  * kill gud with C-x k
  * set breakpoint in code: C-x C-a C-b
  * send INT signal: C-c C-c
* motion
  * scroll down: C-v
  * scroll up: M-v
  * search: C-s
  * reverse search: C-r
  * select: C-spc
* helm:
  * while using find-file
    * C-j to complete directory
  * while searching buffers:
    * C-j to show buffer in other window
  * add a space and then out-of-order additional characters to narrow the search
  * helm-projectile-ag is really good
  * stuck in "Emacs Command History": C-o
  * helm-do-ag
    * hit enter to confirm search directory, then type pattern
    * remember separate args for searching dotfiles
  * tab to show docs/buffer/etc
  * C-c ? = show helm help
* window layouts
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
  * C-p, C-n, tab, return
* terminology
  * emacs window = vim split
  * emacs buffer = vim buffer
  * emacs frame = GUI tab (doesnt work in terminal)
* access remote files: tramp
* manually install rtags (or other packages)
  * build and install rtags to get the .elc files
  * copy the .el and .elc files to ~/.emacs.d/site-lisp/rtags
* performance
  * https://www.reddit.com/r/emacs/comments/4c0mi3/the_biggest_performance_improvement_to_emacs_ive/
    * (remove-hook 'find-file-hooks 'vc-find-file-hook)
* todo:
  * magit
    * merging with magit and ediff
    * evil-magit
  * diff-hl
  * realgud
  * profile emacs
  * anzu
  * python
    * anaconda
    * elpy
    * jedi
    * pep8
    * pylint
  * undo tree
  * helm-swoop
  * vif: view large files in batches
  * hydra
  * switch evil-leader to bind-map or general.el?
  * which-key vs guide-key
  * use-package: organize packages
  * popwin
  * sublimity (needs gui?)
  * fiplr? helm alternative using grizzl
  * replace helm with ivy, swiper and counsel?
  * function-args
  * el doc
  * setup examples:
    * cmake-ide
    * prelude
    * narf emacs
    * spacemacs as reference: packages.el
  * navigation: 
    * cedet: 
      * may not work well with large codebases
      * probably just for C, not C++
    * clang-tags: very similar to rtags, but much fewer contributions...
    * helm-gtags: gnu global tags. does this work well with c++?
    * clang-ctags: like ctags but uses clang
  * completion:
    * front-ends:
      * auto-complete
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
