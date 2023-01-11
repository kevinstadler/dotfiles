#!/bin/sh
#sudo launchctl unload -w ~/.kmonad/kmonad.plist
sudo /sbin/kextload /Library/Application\ Support/org.pqrs/Karabiner-VirtualHIDDevice/Extensions/org.pqrs.driver.Karabiner.VirtualHIDDevice.v061000.kext
if [ "$1" == "debug" ]; then
  sudo /Users/k/.local/bin/kmonad -l debug /Users/k/.kmonad/config.kbd
else
  sudo /Users/k/.local/bin/kmonad /Users/k/.kmonad/config.kbd
#  sudo launchctl load -w ~/.kmonad/kmonad.plist
fi
