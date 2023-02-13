bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
# # "\e[3~" delete-char
# # "\e[2~" quoted-insert
# Shift Up/Down
bindkey "\e[1;2A" history-search-backward
bindkey "\e[1;2B" history-search-forward
# Shift Right/Left
bindkey "\e[1;2C" forward-word
bindkey "\e[1;2D" backward-word

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit
fi
