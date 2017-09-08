#!/bin/bash

TARGET_FOLDER=/opt/xilinx
DIST_NAME=Xilinx_Vivado_SDK_2017.2_0616_1_Lin64.bin
DIST_DIR=../pkg

mkdir -p $DIST_DIR

CUR_USER=`whoami`
sudo mkdir -p $TARGET_FOLDER
sudo chown $CUR_USER $TARGET_FOLDER
echo "Please use $TARGET_FOLDER for your installation"

chmod u+x $DIST_DIR/$DIST_NAME
$DIST_DIR/$DIST_NAME

sudo bash -c "echo 'PATH=\$PATH':$TARGET_FOLDER/Vivado/2017.2/bin/ > /etc/profile.d/mips-mti-elf.sh"
