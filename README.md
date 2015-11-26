* install fzf
  * in fzf/shell/key-bindings.bash, comment out the two bind '"\C-r" lines (68, 87)
  * add following line to .vimrc
    * set rtp+=~/.fzf
    * nmap <C-t> :FZF! <CR>
  * add to .bash_profile
    export FZF_DEFAULT_COMMAND='find .'
    export FZF_CTRL_T_COMMAND='find .'
    export FZF_ALT_C_COMMAND=find .
* readline:
  * reference: http://www.catonmat.net/download/readline-emacs-editing-mode-cheat-sheet.pdf
  * cancel C-r search: C-g
* vundle:
  * add lines to .vimrc
  * run :PluginInstall
* youcompleteme
  * install via vundle: https://github.com/VundleVim/Vundle.vim#about
  * install dependencies: https://github.com/Valloric/YouCompleteMe
  * install ycm-generator via vundle: https://github.com/rdnetto/YCM-Generator
    * install clang
    * make sure your project has a valid build file, e.g. cmake, which ycm-generator will use
    * run generator
      * open top-level source file with vim, then :YcmGenerateConfig
      * should create .ycm_extra_conf.py file in that directory
  * open source file, ycm should prompt loading of .ycm_extra_conf.py
    * run :YcmDiags to check for errors
    * can sometimes fix errors with :YcmCompleter FixIt
