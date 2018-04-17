#!/bin/bash

CUR_DIR=${BASH_SOURCE%/*}
    
source $CUR_DIR/config.bash
source $CUR_DIR/include.bash

# Install the Codescape SDK or toolchains if required
# Check for SDK (is URL uncommented in config?)
if [ -v CODESCAPE_SDK_URL ]; then
    echo "Installing the Codescape MIPS SDK"
    INSTALLER=`check_and_download $CODESCAPE_SDK_URL $DOWNLOAD_DIR $CODESCAPE_SDK_PKG_NAME`
    chmod a+x $INSTALLER
    sudo $INSTALLER
fi

# overwrite the PATH settings
sudo rm -f $CODESCAPE_TOOLCHAINS_PROFILE
find /opt/imgtec/ -type d -name bin | sort -r | xargs -I {} echo 'export PATH=$PATH:'{} | sudo tee -a $CODESCAPE_TOOLCHAINS_PROFILE

# addign current user to dialout group to use /dev/ttyUSB* for hardware debug
sudo adduser `whoami` dialout
