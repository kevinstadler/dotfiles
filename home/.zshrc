autoload -U colors && colors
PS1="%F{yellow}[%D{%a %b %-d} %*] %F{blue}%n: %F{red}%1~ %F{magenta}%# %F{white}"

alias ls="ls -G"
alias ll="ls -al"
alias lh="ll -h"

bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
# # "\e[3~" delete-char
# # "\e[2~" quoted-insert
# Shift Up/Down
bindkey "\e[5~" history-search-backward
bindkey "\e[6~" history-search-forward
# # Shift Right/Left
bindkey "\e[1;2C" forward-word
bindkey "\e[1;2D" backward-word
# # Ctrl Right/Left
bindkey "^[[1;5D" beginning-of-line
bindkey "^[[1;5C" end-of-line

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit
fi
