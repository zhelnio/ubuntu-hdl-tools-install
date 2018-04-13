#!/bin/bash

CUR_DIR=${BASH_SOURCE%/*}
    
source $CUR_DIR/install.conf
source $CUR_DIR/include.bash

# check if MARS is already installed
if [ -"$(command -v mars)" != 0 ]; then
  echo 'MARS is already installed' >&2
  exit 0
fi

# search for package or download it
PROGRAM_JAR=`check_and_download $MARS_URL $DOWNLOAD_DIR $MARS_PKG_NAME`

# install 
sudo mkdir -p $MARS_PATH
sudo cp $PROGRAM_JAR $MARS_PATH

# write the PATH
JAR=$(basename $PROGRAM_JAR)
echo "alias mars='java -jar $MARS_PATH/$JAR'" | sudo tee $MARS_PROFILE
