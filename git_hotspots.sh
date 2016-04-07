#!/bin/bash

git log --name-only | ag "/.*\.(c|cpp|cxx|h|hpp)$" | sort | uniq -c | sort -rg | head -10 | xargs -I% printf "printf 'file: '; printf '%' | awk '{print \$2}' | xargs -I'%%' printf '%%'; printf ' commits: '; printf '%' | awk '{print \$1}' | xargs -I'%%' printf '%%'; printf ' committers: '; printf '%' | awk '{print \$2}' | xargs -I'%%' git log -- '%%' | ag Author | sort | uniq | wc -l\n" | bash | sort -r -k4
