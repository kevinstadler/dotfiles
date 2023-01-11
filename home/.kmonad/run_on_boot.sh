#!/bin/sh
sudo cp kmonad.plist /Library/LaunchDaemons/
sudo launchctl load -w /Library/LaunchDaemons/kmonad.plist
