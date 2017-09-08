#!/bin/bash

TARGET_FOLDER=/opt/altera
DIST_NAME=Quartus-lite-16.1.0.196-linux.tar
DIST_DIR=../pkg

mkdir -p $DIST_DIR

CUR_USER=`whoami`
sudo mkdir -p $TARGET_FOLDER
sudo chown $CUR_USER $TARGET_FOLDER

mkdir $DIST_DIR/quartus
tar -xf $DIST_DIR/$DIST_NAME -C $DIST_DIR/quartus

$DIST_DIR/quartus/setup.sh --installdir $TARGET_FOLDER
