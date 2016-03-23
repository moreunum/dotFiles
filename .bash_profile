# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Bash completion
if [ -f /etc/bash_completion ]; then
     . /etc/bash_completion 
fi

# User specific environment and startup programs

export PATH=$PATH:$HOME/.local/bin:$HOME/bin

# fzf
export FZF_DEFAULT_COMMAND='find .'
export FZF_CTRL_T_COMMAND='find .'
export FZF_ALT_C_COMMAND='find .'

# cmake
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

# emacs
alias ec='emacsclient'
