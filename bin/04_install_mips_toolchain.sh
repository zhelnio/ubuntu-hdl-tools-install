#!/bin/bash

CUR_DIR=${BASH_SOURCE%/*}
    
source $CUR_DIR/install.conf
source $CUR_DIR/include.bash

# install MIPS toolchain from Ubuntu repository
#sudo apt install gcc-mipsel-linux-gnu

# Install the Codescape SDK or toolchains if required
# Check for SDK (is URL uncommented in config?)
if [ -v CODESCAPE_SDK_URL ]; then
    echo "Installing the Codescape MIPS SDK"
    INSTALLER=`check_and_download $CODESCAPE_SDK_URL $DOWNLOAD_DIR $CODESCAPE_SDK_PKG_NAME`
    chmod a+x $INSTALLER
    sudo $INSTALLER
fi

# Check for Bare Metal toolchain (is URL uncommented in config?)
if [ -v CODESCAPE_BAREMETAL_URL ]; then
    echo "Installing the Codescape MIPS Bare Metal toolchain"
    INSTALLER_TGZ=`check_and_download $CODESCAPE_BAREMETAL_URL $DOWNLOAD_DIR $CODESCAPE_BAREMETAL_PKG_NAME`

    sudo mkdir -p $CODESCAPE_TOOLCHAINS_PATH
    sudo tar -xzf $INSTALLER_TGZ -C $CODESCAPE_TOOLCHAINS_PATH

    #fix the perms
    sudo find $CODESCAPE_TOOLCHAINS_PATH -exec chmod o-w {} \;
fi

# Check for Linux toolchain (is URL uncommented in config?)
if [ -v CODESCAPE_LINUX_URL ]; then
    echo "Installing the Codescape MIPS Linux toolchain"
    INSTALLER_TGZ=`check_and_download $CODESCAPE_LINUX_URL $DOWNLOAD_DIR $CODESCAPE_LINUX_PKG_NAME`

    sudo mkdir -p $CODESCAPE_TOOLCHAINS_PATH
    sudo tar -xzf $INSTALLER_TGZ -C $CODESCAPE_TOOLCHAINS_PATH

    #fix the perms
    sudo find $CODESCAPE_TOOLCHAINS_PATH -exec chmod o-w {} \;
fi

# overwrite the PATH settings
sudo rm -f $CODESCAPE_TOOLCHAINS_PROFILE
find /opt/imgtec/ -type d -name bin | sort -r | xargs -I {} echo 'export PATH=$PATH:'{} | sudo tee -a $CODESCAPE_TOOLCHAINS_PROFILE

# addign current user to dialout group to use /dev/ttyUSB* for hardware debug
sudo adduser `whoami` dialout
