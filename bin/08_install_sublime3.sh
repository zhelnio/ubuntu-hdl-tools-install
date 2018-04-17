#!/bin/bash

CUR_DIR=${BASH_SOURCE%/*}
    
source $CUR_DIR/config.bash
source $CUR_DIR/include.bash

wget -qO - "$SUBLIME_REPO_KEY" | sudo apt-key add -
echo "$SUBLIME_REPO_URL" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install sublime-text
