#!/bin/sh
PS1="\[\033[33m\][\d \t] \[\033[34m\]\u: \[\033[31m\]\w \[\033[35m\]\$ \[\033[39m\]"

alias ls="ls -G"
alias ll="ls -al"
alias lh="ll -h"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH="$HOME/bin:$PATH"

# To enable the `homeshick cd <CASTLE>` command, you need to
#   `export HOMESHICK_DIR=/usr/local/opt/homeshick`
# and
#   `source "/usr/local/opt/homeshick/homeshick.sh"`
# in your $HOME/.bashrc

export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
