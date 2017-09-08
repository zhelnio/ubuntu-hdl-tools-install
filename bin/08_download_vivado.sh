#!/bin/bash

#Please your download URL from https://www.xilinx.com/support/download.html
#auth on Xilinx site is required
DOWNLOAD_URL="https://xilinx-ax-dl.entitlenow.com/dl/ul/2017/06/16/R209883081/Xilinx_Vivado_SDK_2017.2_0616_1_Lin64.bin/734bdedd4f9720ad462ee733b71a0988/59B371A4?akdm=0&filename=Xilinx_Vivado_SDK_2017.2_0616_1_Lin64.bin"

DIST_DIR=../pkg

mkdir -p $DIST_DIR
cd $DIST_DIR

wget --content-disposition $DOWNLOAD_URL

cd -
