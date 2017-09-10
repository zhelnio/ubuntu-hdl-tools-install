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

sudo bash -c "echo 'PATH=\$PATH':$TARGET_FOLDER/mips-mti-linux-gnu/2016.05-06/bin/ > /etc/profile.d/mips-mti-linux-gnu.sh"
sudo bash -c "echo 'PATH=\$PATH':$TARGET_FOLDER/mips-mti-elf/2016.05-06/bin/ > /etc/profile.d/mips-mti-elf.sh"

. /etc/profile.d/mips-mti-linux-gnu.sh
. /etc/profile.d/mips-mti-elf.sh
