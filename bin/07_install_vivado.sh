#!/bin/bash

CUR_DIR=${BASH_SOURCE%/*}
    
source $CUR_DIR/config.bash
source $CUR_DIR/include.bash

# download the web installer or find it in pkg folder
INSTALLER=`check_and_download ${VIVADO_URL} ${DOWNLOAD_DIR} ${VIVADO_PKG_NAME}`

# create the target folder
CUR_USER=`whoami`
sudo mkdir -p $VIVADO_INSTALL_PATH
sudo chown $CUR_USER $VIVADO_INSTALL_PATH

# run the web installer
chmod a+x $INSTALLER
echo "Please use $VIVADO_INSTALL_PATH for your installation"
$INSTALLER

# set the profile settings
SETTINGS_FILE=`find /opt/xilinx/Vivado/ -regextype sed -regex ".*/Vivado/[a-f0-9\.]*/settings64.sh" | sort -r | head -n 1`
sudo ln -s $SETTINGS_FILE $VIVADO_PROFILE
