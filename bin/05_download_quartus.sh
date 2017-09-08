#!/bin/bash

DIST_DIR=../pkg

mkdir -p $DIST_DIR
cd $DIST_DIR

# https://www.altera.com/products/design-software/fpga-design/quartus-prime/download.html
wget http://download.altera.com/akdlm/software/acdsinst/16.1/196/ib_tar/Quartus-lite-16.1.0.196-linux.tar

cd -
