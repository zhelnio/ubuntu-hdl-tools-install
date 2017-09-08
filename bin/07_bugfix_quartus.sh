#!/bin/bash

ALTERA_PATH=/opt/altera/16.1

CUR_DIR=`pwd`

sudo dpkg --add-architecture i386
sudo apt update

#installing x32 libs
sudo apt install gcc-multilib g++-multilib \
lib32z1 lib32stdc++6 lib32gcc1 \
expat:i386 fontconfig:i386 libfreetype6:i386 libexpat1:i386 libc6:i386 libgtk-3-0:i386 \
libcanberra0:i386 libice6:i386 libsm6:i386 libncurses5:i386 zlib1g:i386 \
libx11-6:i386 libxau6:i386 libxdmcp6:i386 libxext6:i386 libxft2:i386 libxrender1:i386 \
libxt6:i386 libxtst6:i386

cd /tmp

#getting old libpng from archive
wget http://de.archive.ubuntu.com/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb
sudo apt install gdebi-core
sudo gdebi ./libpng12-0_1.2.54-1ubuntu1_amd64.deb

#building freetype
wget http://download.savannah.gnu.org/releases/freetype/freetype-2.4.12.tar.bz2
tar -xjvf freetype-2.4.12.tar.bz2
cd freetype-2.4.12
./configure --build=i686-pc-linux-gnu "CFLAGS=-m32" "CXXFLAGS=-m32" "LDFLAGS=-m32"
make -j8
mkdir -p $ALTERA_PATH/modelsim_ase/lib32
sudo cp objs/.libs/libfreetype.so* $ALTERA_PATH/modelsim_ase/lib32

cd $CUR_DIR

#patching modelsim script
SIM_SCRIPT=$ALTERA_PATH/modelsim_ase/vco
cp $SIM_SCRIPT $SIM_SCRIPT.orig
chmod u+w $SIM_SCRIPT
patch -i ./quartus.16.1-ubuntu.17.04.patch $SIM_SCRIPT
chmod u-w $SIM_SCRIPT
