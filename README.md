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
  * can use compile_commands.json by putting path to the file in the .ycm_extra_conf file
    * http://wiki.yangleo.me/2013/10/27/YouCompleteMe-installation-and-configurations.html
  * Seems to sometimes take a little bit of fiddling to get tab suggestions for members of existing code.
  * when using YCM on the rtags project, had some compiler errors in one of the files (missing includes?)
* rtags
  * install: https://github.com/Andersbakken/rtags
    * follow build instructions. Requires clang-devel and llvm-devel packages.
  * run rtags/bin/rdm in the background
  * Use cmake to generate compile_commands.json for the project
  * run rtags/bin/rc -J /path/to/compile_commands.json
    * this feeds the cmake build instructions into the rdm program
    * can connect to rdm's stdout and see what it's doing
  * install vim plugin with vundle: https://github.com/lyuts/vim-rtags
* ag -g <file name text> - search for file names
