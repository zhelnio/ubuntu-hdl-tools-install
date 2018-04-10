#!/bin/bash

TARGET_FOLDER=/opt/mars

SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
DIST_DIR=$SCRIPTPATH/../pkg

mkdir -p $DIST_DIR
cd $DIST_DIR

wget http://courses.missouristate.edu/KenVollmar/mars/MARS_4_5_Aug2014/Mars4_5.jar

cd -

CUR_USER=`whoami`
sudo mkdir -p $TARGET_FOLDER
sudo cp $DIST_DIR/Mars4_5.jar $TARGET_FOLDER

echo "alias mars='java -jar $TARGET_FOLDER/Mars4_5.jar'" >> ~/.bash_aliases
