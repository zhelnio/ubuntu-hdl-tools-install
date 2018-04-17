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



# TARGET_FOLDER=/opt/xilinx
# DIST_NAME=Xilinx_Vivado_SDK_2017.2_0616_1_Lin64.bin

# SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
# DIST_DIR=$SCRIPTPATH/../pkg

# mkdir -p $DIST_DIR

# CUR_USER=`whoami`
# sudo mkdir -p $TARGET_FOLDER
# sudo chown $CUR_USER $TARGET_FOLDER
# echo "Please use $TARGET_FOLDER for your installation"

# chmod u+x $DIST_DIR/$DIST_NAME
# $DIST_DIR/$DIST_NAME

# sudo bash -c "echo 'PATH=\$PATH':$TARGET_FOLDER/Vivado/2017.2/bin/ > /etc/profile.d/vivado-2017.2.sh"
