#!/bin/bash

TARGET_FOLDER=/opt/codescape

SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
DIST_DIR=$SCRIPTPATH/../pkg

mkdir -p $DIST_DIR

cd $DIST_DIR

#https://community.imgtec.com/developers/mips/tools/codescape-mips-sdk/
wget --content-disposition https://community.imgtec.com/?do-download=linux-x64-mti-bare-metal-2016-05-06
wget --content-disposition https://community.imgtec.com/?do-download=linux-x64-mti-gnu-linux-2016-05-06

cd -

CUR_USER=`whoami`
sudo mkdir -p $TARGET_FOLDER
sudo chown $CUR_USER $TARGET_FOLDER

tar -xzf $DIST_DIR/Codescape.GNU.Tools.Package.2016.05-06.for.MIPS.MTI.Linux.CentOS-5.x86_64.tar.gz -C $TARGET_FOLDER
tar -xzf $DIST_DIR/Codescape.GNU.Tools.Package.2016.05-06.for.MIPS.MTI.Bare.Metal.CentOS-5.x86_64.tar.gz -C $TARGET_FOLDER

echo 'PATH=$PATH':$TARGET_FOLDER/mips-mti-linux-gnu/2016.05-06/bin/ | sudo tee /etc/profile.d/mips-mti-linux-gnu.sh
echo export MIPS_LINUXGNU_ROOT=$TARGET_FOLDER/mips-mti-linux-gnu/2016.05-06 | sudo tee -a /etc/profile.d/mips-mti-linux-gnu.sh

echo 'PATH=$PATH':$TARGET_FOLDER/mips-mti-elf/2016.05-06/bin/ | sudo tee /etc/profile.d/mips-mti-elf.sh
echo export MIPS_ELF_ROOT=$TARGET_FOLDER/mips-mti-elf/2016.05-06 | sudo tee -a /etc/profile.d/mips-mti-elf.sh

#adding current user to dialout group to use /dev/ttyUSB0 for hardware debug
sudo gpasswd --add $CUR_USER dialout
