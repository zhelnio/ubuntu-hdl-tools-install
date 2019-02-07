#!/bin/bash

CUR_DIR=${BASH_SOURCE%/*}
    
source $CUR_DIR/config.bash
source $CUR_DIR/include.bash

source ~/.bash_aliases

# check if MARS is already installed
if [ "$(alias mars 2>/dev/null)" ]; then
  echo 'MARS is already installed' >&2
  exit 0
fi

# search for package or download it
PROGRAM_JAR=`check_and_download $MARS_URL $DOWNLOAD_DIR $MARS_PKG_NAME`

# install default java if it is not installed
if ! [ -x "$(command -v java)" ]; then
  echo 'Java not found. Installing the default one' >&2
  sudo apt install default-jre
fi

# install 
sudo mkdir -p $MARS_PATH
sudo cp $PROGRAM_JAR $MARS_PATH

# write the PATH
JAR=$(basename $PROGRAM_JAR)
echo "alias mars='java -jar $MARS_PATH/$JAR'" >> ~/.bash_aliases
source ~/.bash_aliases

echo 'MARS installed successfully'
