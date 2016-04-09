* python CLI framework to run and display various code-comprehension tools that I come up with
    * centered around a web-page "workspace", that you can add new information to
    * find, and graph, processes and threads
    * find shared libraries and graph them
    * lsof: find resources for a process, and add them into block diagram
    * finding hot files
        * biggest, most commits, most committers
        * some way to correlate these to figure out which files are most important, and display that
    * find hot functions
        * run perf
        * poke the app in some way
        * stop perf, collect the app's call graphs, make graphviz diagrams of them, and host them in a web interface sort of like doxygen