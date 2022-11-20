#!/bin/sh
sudo launchctl unload -w ~/.kmonad/kmonad.plist
if [ "$1" == "debug" ]; then
  sudo kmonad config.kbd -l debug
else
  sudo launchctl load -w ~/.kmonad/kmonad.plist
fi
