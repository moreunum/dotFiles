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
* readline:
  * Macros: C-x (, C-x ), C-x e
  * Expand variables: M-C-e
  * Kill and paste: C-k or C-w, C-y
  * show all bound commands: bind -P
  * use modifiers to move multiple times at once:
    * M-2, C-M-] s  - move back two s
  * M-y: cycle through previously yanked
  * open current command in $EDITOR: C-x C-e
    * open previous command: fc
* vim
  * execute macro on every line:  :'<,'>norm @q
  * visual select join
  * visual-in-paragraph
  * search or colon, then paste the word the cursor is on: C-r C-w
  * primitive dev environment:
    * ctags, omni-complete
    * make, quick-fix
    * [<TAB> to jump to class/global definitions (just simple text search)
    * gf - go to file
* gdb
  * convenience variables
    * set $m = (MyStruct*)malloc(sizeof(MyStruct))    \*
    * call $m->add(1,2)
    * p $m->x
    * set $m = malloc(10)
    * call strcpy($m, "string")
    * call free($m)
    * set $ms = "my string"
    * set $m3 = {0,1,2,3}

===================================================
* code analysis:
  * high-level
    * what is project supposed to do? Look at docs, ask people
    * build and run project (with debugger)
    * learn how to use the feature you're working on
        * if it's a standalone app, run it
        * if it's a library, make a small program that uses it
    * identify hotspots: important components
        * for each logical component:
          * point of contact
          * processes/threads
            * ps auxm
          * external resources (files, etc...)
            * lsof -p 13008
              * shared libraries
              * ports
              * files
          * important source files
            * most commits: 
              * git log --name-only | ag "/.*\.(c|cpp|cxx|h|hpp)$" | sort | uniq -c | sort -rg | head -100
              * most committers
              * biggest files
              * find interesting intersections between these
          * important functions
            * main loop: 
                * gdb attach, bt, switch threads
                * gdb -batch -ex "thread apply all bt" -p <pid>
                * gstack <pid> = gives snapshot of processes in each thread
                * perf (doesn't seem to work every time)
                    * perf record -p <pid> --call-graph dwarf
                    * perf report --stdio --sort dso -g flat,0.1,callee,function
        * if it's a library, use your example program for analysis
        * external data stores
        * shared libraries
        * source files:
          * git-extras
          * frecency files
          * files edited by many people
          * identify "owners" of important files
        * most heavily-used internal data structures
        * interfaces to external components/libraries
  * intermediate-level: a collection of classes/files that perform a particular task
    * doxygen: call-graphs, class hierarchies
    * "main loop" (perf?)
  * granular-level: individual classes and functions
    * debugger
    * unit tests

* redis analysis example
  * logical components
    * starter thread (4):
      * listening port 6379
      * server.c
        * main()
      * ae.c
        * aeProcessEvents()
        * aeMain()
      * ae_poll.c
        * aeApiPoll()
    * most commits:
        593 src/redis.c
        498 src/cluster.c
        497 src/redis.h
        247 src/networking.c
        221 src/sentinel.c
        182 src/config.c
        176 src/replication.c

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
    * tools
      * gprof, systemtap, perf, gdb, sysdig, fenris, cachegrind, callgrind
      * get symbols from binary
        * nm -C
          * nm -l = show line numbers
          * nm -g = show only external symbols (defined in another source file)
          * nm --defined-only
        * objdump -C -t
        * readelf -s
          * identifies function vs object, but doesn't unmangle c++?
        * gdb
          * gdb -ex <command> = execute command
          * gdb -command=<file> = execute file of gdb commands
          * gdb -q -p 2999 --command=gdb_commands
            * need to kill gdb to exit this it looks like...
          * break on new/delete/malloc/free (assumes that heap is important)
      
    * hotspots
      * files: commits, committers, size
      * most used classes, public methods
        * classes in memory?
        * some way to visualize the set of class-members that control a logical task?
      * identify important data structures
      * for each, set breakpoints on all, run gdb, and see what pops up
      * some way of visualizing/selecting overlap between types of hotspots
