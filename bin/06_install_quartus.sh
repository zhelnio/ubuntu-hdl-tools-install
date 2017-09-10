#!/bin/bash

TARGET_FOLDER=/opt/altera/16.1
DIST_NAME=Quartus-lite-16.1.0.196-linux.tar

SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
DIST_DIR=$SCRIPTPATH/../pkg
TMP_DIR=/tmp

mkdir -p $DIST_DIR

CUR_USER=`whoami`
sudo mkdir -p $TARGET_FOLDER
sudo chown $CUR_USER $TARGET_FOLDER

mkdir $TMP_DIR/quartus
tar -xf $DIST_DIR/$DIST_NAME -C $TMP_DIR/quartus

$TMP_DIR/quartus/setup.sh --installdir $TARGET_FOLDER

sudo bash -c "echo 'PATH=\$PATH':$TARGET_FOLDER/quartus/bin/:$TARGET_FOLDER/modelsim_ase/bin/ > /etc/profile.d/quartus-16.1.sh"

sudo cp $SCRIPT_PATH/100-altera.rules /etc/udev/rules.d/
sudo service udev restart
