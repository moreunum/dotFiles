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
    * This is a good thing to try if the project won't build properly
    * http://wiki.yangleo.me/2013/10/27/YouCompleteMe-installation-and-configurations.html
  * Seems to sometimes take a little bit of fiddling to get tab suggestions for members of existing code.
  * when using YCM on the rtags project, had some compiler errors in one of the files (missing includes?)
  * emacs-ycm
    * yum install python34-devel?
    * recursive checkout and build ycmd into installed directory
* rtags
  * install: https://github.com/Andersbakken/rtags
    * follow build instructions. Requires clang-devel and llvm-devel packages.
  * run rtags/bin/rdm in the background
  * Use cmake to generate compile_commands.json for the project
    * cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 .
  * run rtags/bin/rc -J /path/to/compile_commands.json
    * this feeds the cmake build instructions into the rdm program
    * can connect to rdm's stdout and see what it's doing
  * install vim plugin with vundle: https://github.com/lyuts/vim-rtags
* ag -g <file name text> - search for file names
* spacemacs
  * GUD = grand unified debugger
    * C-c brings up SPC window in GUD
  * C-x k = kill buffer. Need this to exit GUD
* conqueGdb
  * start vim then run :ConqueGdb path/to/binary
  * to quit, go into the gdb window and C-d then close the window
  * get rid of gdb license: open .vim/bundle/Conque-GDB/autoload/conque_gdb.vim
    * find the ' -f -x ' and make it ' -q -f -x '
* clang static analyzer:
  * yum install clang-analyzer
  * add ccc-analayzer location to PATH (/usr/libexec/clang/...)
    export CCC_CC=clang
    export CCC_CXX=clang++
    export CC=ccc-analyzer
    export CXX=c++-analyzer
    export LD=clang++
    cmake -DCMAKE_BUILD_TYPE=Debug ..
    make
  * should see "warning generated"
* clang:
  * show compiler flags: clang -cc1 --help
  * https://github.com/google/sanitizers
* sanitizer blacklist to ignore third-party files/functions like gtest:
    export CXXFLAGS="$CXXFLAGS -fsanitize-blacklist=blacklist.txt"  
    export CFLAGS="$CFLAGS -fsanitize-blacklist=blacklist.txt"  
    export LDFLAGS="$LDFLAGS -fsanitize-blacklist=blacklist.txt"  
  * http://clang.llvm.org/docs/SanitizerSpecialCaseList.html
* clang address sanitizer:
    export LD=clang++  
    export CC=clang  
    export CXX=clang++  
    export CFLAGS="-fsanitize=address -fno-omit-frame-pointer -O1 -fno-optimize-sibling-calls"  
    export CXXFLAGS="-fsanitize=address -fno-omit-frame-pointer -O1 -fno-optimize-sibling-calls"  
    export LDFLAGS="-fsanitize=address -fno-omit-frame-pointer -O1 -fno-optimize-sibling-calls"  
    export ASAN_SYMBOLIZER_PATH=$(which llvm-symbolizer)  
    export LLVM_SYMBOLIZER=$(which llvm-symbolizer)  
    export ASAN_OPTIONS="detect_leaks=1:check_initialization_order=1"  
    cmake -DCMAKE_BUILD_TYPE=Debug ..  
    make  
    make test CTEST_OUTPUT_ON_FAILURE=true  
* clang memory sanitizer (can't use this with address sanitizer):
    export LD=clang++  
    export CC=clang  
    export CXX=clang++  
    export CFLAGS="-fsanitize=memory -fsanitize-memory-track-origins -fno-omit-frame-pointer -O1"  
    export CXXFLAGS="-fsanitize=memory -fsanitize-memory-track-origins -fno-omit-frame-pointer -O1"  
    export LDFLAGS="-fsanitize=memory -fsanitize-memory-track-origins -fno-omit-frame-pointer -O1"  
    export MSAN_SYMBOLIZER_PATH=$(which llvm-symbolizer)  
    cmake -DCMAKE_BUILD_TYPE=Debug ..  
    make  
    make test CTEST_OUTPUT_ON_FAILURE=true  
* clang thread sanitizer:
    export LD=clang++  
    export CC=clang  
    export CXX=clang++  
    export CFLAGS="-fsanitize=thread -O2"  
    export CXXFLAGS="-fsanitize=thread -O2"  
    export LDFLAGS="-fsanitize=thread -O2"  
    cmake -DCMAKE_BUILD_TYPE=Debug ..  
    make  
    make test CTEST_OUTPUT_ON_FAILURE=true  
* code analysis:
  * doxygen with graphviz
  * identify major patterns used
  * identify important threads
  * mind map drawing of related stuff
    * in addition to block diagrams
    * maybe start with most edited files and most called functions?
  * create a glossary
  * deliverables while learning
    * update existing documentation before updating code
    * write unit tests
    * write integration tests
    * automate existing integration tests?
  * identify third-party libraries
    * what is the purpose of each?
  * focus on using the app first before learning the code
    * if a library, make tests to use it
  * locate the following components
    * put these in the mind map
    * startup code and entry point
      * trace this first with debugger
    * shutdown/cleanup code
    * configuration code
      * where is config stored?
    * runtime data store and major data structures
    * user interface code

jenkins tools:
* jenkins email:http://www.nailedtothex.org/roller/kyle/entry/articles-jenkins-email
* connect jenkins to github:
	* http://fourkitchens.com/blog/article/trigger-jenkins-builds-pushing-github
	* install plugins manually: http://stackoverflow.com/questions/14950408/how-to-install-a-plugin-in-jenkins-manually
* jenkins warnings plugin: scans compilation output for warnings
	* more incentive to build with multiple compilers?
* clang static analyzer
	* just run scan-build command line tool? http://clang-analyzer.llvm.org/scan-build.html
		* should build with debug for this
* address sanitizer: may be easier with gcc: http://btorpey.github.io/blog/2014/03/27/using-clangs-address-sanitizer/
	* prob need to build clang from source in my container with the right options
	* can add new compiler flags via command line, just like any other cmake variable?
	* leak sanitizer
	* thread sanitizer
	* memory sanitizer
* compile with gcc using gcov
	* use jenkins "sidebar link" plugin to privide link from job page to gcov html output?
* create new user for jenkins w/ github access (who can do this? ask at standup?)
* valgrind? how to use with ctest? http://stackoverflow.com/questions/9303711/how-do-i-make-ctest-run-a-program-with-valgrind-without-dart
* cccc plugin?
* xunit w/ ctest? http://stackoverflow.com/questions/21633716/producing-ctest-results-in-jenkins-xunit-1-58
* dry plugin: needs proprietary tools?
* tasks plugin: looks for todos?
