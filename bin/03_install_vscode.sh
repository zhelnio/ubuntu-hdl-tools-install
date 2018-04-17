#!/bin/bash

# inclide the config
CUR_DIR=${BASH_SOURCE%/*}
    
source $CUR_DIR/config.bash
source $CUR_DIR/include.bash

function install_extensions
{
    echo 'Installing the VSCode extensions:'
    code --install-extension ms-vscode.cpptools
    code --install-extension donjayamanne.githistory
    code --install-extension slevesque.vscode-hexdump
    code --install-extension kdarkhan.mips
    code --install-extension mshr-h.systemverilog
    code --install-extension mshr-h.veriloghdl
    code --install-extension sleutho.tcl
    code --install-extension eamodio.gitlens
    code --install-extension plorefice.devicetree
}

# check if VSCode is already installed
if [ -x "$(command -v code)" ]; then
  echo 'Visual Studio Code is already installed' >&2
  install_extensions
  exit 0
fi

# search for package or download it
INSTALLER=`check_and_download $VSCODE_PKG_URL $DOWNLOAD_DIR $VSCODE_PKG_NAME`

# package install
sudo apt install gdebi-core
sudo gdebi $INSTALLER

# VSCode extensions install
install_extensions
