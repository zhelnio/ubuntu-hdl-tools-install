#!/bin/bash

# Please get your download URL from https://www.xilinx.com/support/download.html
# Auth on Xilinx site is required
# The simple way to get this link is to start download 'Xilinx_Vivado_SDK_2017.2_0616_1_Lin64.bin' 
# in browser and then copy the URL of downloading file

DOWNLOAD_URL="<insert your link>"

SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
DIST_DIR=$SCRIPTPATH/../pkg

mkdir -p $DIST_DIR
cd $DIST_DIR

wget --content-disposition $DOWNLOAD_URL

cd -
