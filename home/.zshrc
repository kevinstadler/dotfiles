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
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby ruby-3.2.1
export PATH="/usr/local/opt/icu4c/bin:$PATH"
# sudo ln -sfn $HOMEBREW_PREFIX/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk
#export JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_HOME="/usr/local/opt/openjdk@17"
#For the system Java wrappers to find this JDK, symlink it with
  # sudo ln -sfn /usr/local/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk

# openjdk@17 is keg-only, which means it was not symlinked into /usr/local,
# because this is an alternate version of another formula.

# If you need to have openjdk@17 first in your PATH, run:
  # echo 'export PATH="/usr/local/opt/openjdk@17/bin:$PATH"' >> ~/.zshrc
export PATH="/usr/local/opt/openjdk@17/bin:$PATH"

# For compilers to find openjdk@17 you may need to set:
export CPPFLAGS="-I/usr/local/opt/openjdk@17/include"

export PATH="$HOME/bin:$PATH"
