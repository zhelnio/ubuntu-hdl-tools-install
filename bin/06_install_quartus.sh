#!/bin/bash

CUR_DIR=${BASH_SOURCE%/*}
    
source $CUR_DIR/config.bash
source $CUR_DIR/include.bash

function quartus_unpack
{
    TGZ=$1

    rm -rf $QUARTUS_LITE_UNPACK_PATH
    mkdir -p $QUARTUS_LITE_UNPACK_PATH
    tar -xf $TGZ -C $QUARTUS_LITE_UNPACK_PATH

    echo "Unpacked to $QUARTUS_LITE_UNPACK_PATH"
}

function quartus_target_folder
{
    # get Quartus version (17.1) and edition (Lite)
    QUARTUS_VERSION=`$QUARTUS_LITE_INSTALLER --version | awk -F'|---' '{print $1}' | awk '{print $NF}'`
    QUARTUS_EDITION=`$QUARTUS_LITE_INSTALLER --version | awk '{print tolower($3)}'`

    # form folder name
    QUARTUS_FOLDER="quartus_${QUARTUS_VERSION}_${QUARTUS_EDITION}_"
    INSTALL_FOLDER=$QUARTUS_LITE_INSTALL_PATH/$QUARTUS_FOLDER

    #create target folder
    sudo mkdir -p $INSTALL_FOLDER
    sudo chown `whoami` $INSTALL_FOLDER

    echo $INSTALL_FOLDER
}

function quartus_set_PATH
{
    # set the PATH
    sudo rm -f $QUARTUS_LITE_PROFILE
    find $QUARTUS_LITE_INSTALL_PATH  | grep "quartus/bin$" | sort -r | xargs -I {} echo 'export PATH=$PATH:'{} | sudo tee -a $QUARTUS_LITE_PROFILE
    find $QUARTUS_LITE_INSTALL_PATH  | grep "modelsim_ase/bin$" | sort -r | xargs -I {} echo 'export PATH=$PATH:'{} | sudo tee -a $QUARTUS_LITE_PROFILE
}

function quartus_set_udev_rules
{
    # adding udev rules
    sudo cp $MISCELLANEOUS_DIR/100-altera.rules /etc/udev/rules.d/
    sudo service udev restart
}

function modelsim_patch
{
    INSTALL_FODLER=$1

    # installing x32 libs
    sudo dpkg --add-architecture i386
    sudo apt update
    
    sudo apt install gcc-multilib g++-multilib \
    lib32z1 lib32stdc++6 lib32gcc1 \
    expat:i386 fontconfig:i386 libfreetype6:i386 libexpat1:i386 libc6:i386 libgtk-3-0:i386 \
    libcanberra0:i386 libice6:i386 libsm6:i386 libncurses5:i386 zlib1g:i386 \
    libx11-6:i386 libxau6:i386 libxdmcp6:i386 libxext6:i386 libxft2:i386 libxrender1:i386 \
    libxt6:i386 libxtst6:i386

    CUR_DIR=$(pwd)
    cd /tmp

    # getting old libpng from archive
    wget http://de.archive.ubuntu.com/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb
    sudo apt install gdebi-core
    sudo gdebi ./libpng12-0_1.2.54-1ubuntu1_amd64.deb

    # building freetype
    wget http://download.savannah.gnu.org/releases/freetype/freetype-2.4.12.tar.bz2
    tar -xjvf freetype-2.4.12.tar.bz2
    cd freetype-2.4.12
    ./configure --build=i686-pc-linux-gnu "CFLAGS=-m32" "CXXFLAGS=-m32" "LDFLAGS=-m32"
    make -j8
    mkdir -p $INSTALL_FODLER/modelsim_ase/lib32
    sudo cp objs/.libs/libfreetype.so* $INSTALL_FODLER/modelsim_ase/lib32

    cd $CUR_DIR

    # patching modelsim script
    SIM_SCRIPT=$INSTALL_FODLER/modelsim_ase/vco
    cp $SIM_SCRIPT $SIM_SCRIPT.orig
    chmod u+w $SIM_SCRIPT

    patch -i $MISCELLANEOUS_DIR/quartus.16.1-ubuntu.17.04.patch $SIM_SCRIPT
    chmod u-w $SIM_SCRIPT
}

# main script flow

echo "Installing the Intel Quartus Lite"

# 01. Download the installer
INSTALLER_TGZ=`check_and_download $QUARTUS_LITE_URL $DOWNLOAD_DIR $QUARTUS_LITE_PKG_NAME`

# 02. Unpack it
quartus_unpack $INSTALLER_TGZ

# 03. form the target folder path
QUARTUS_LITE_INSTALL_FOLDER=$(quartus_target_folder)

# 04. run the installer
$QUARTUS_LITE_INSTALLER --installdir $QUARTUS_LITE_INSTALL_FOLDER

# 05. add bin to PATH
quartus_set_PATH

# 06. set udev rules
quartus_set_udev_rules

# 07. patch the modelsim
modelsim_patch $QUARTUS_LITE_INSTALL_FOLDER

echo "Installing the Intel Quartus Lite finished"
