#!/bin/bash

DIST_DIR=../pkg

sudo apt install gdebi-core

mkdir -p $DIST_DIR

cd $DIST_DIR

# https://code.visualstudio.com/docs/setup/linux
wget --content-disposition https://go.microsoft.com/fwlink/?LinkID=760868

sudo gdebi ./code_*_amd64.deb

cd -

