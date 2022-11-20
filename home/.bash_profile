#!/bin/sh
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.2
