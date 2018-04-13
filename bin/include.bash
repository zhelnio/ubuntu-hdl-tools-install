
# search for file and download it if not found
function check_and_download
{
    DOWNLOAD_URL=$1
    DOWNLOAD_DIR=$2
    FILE_2CHECK=$3

    # search for downloaded package
    for i in $DOWNLOAD_DIR/$FILE_2CHECK; do
        if [ -f "$i" ]; then 
            DOWNLOADED_FILE=$i ;
            echo >&2 "File found: $DOWNLOADED_FILE"; 
        fi
        break
    done

    # return if found
    if [ -e "$DOWNLOADED_FILE" ]; then
        echo $DOWNLOADED_FILE
        return
    fi

    # download
    wget --directory-prefix=$DOWNLOAD_DIR --content-disposition $DOWNLOAD_URL

    # search for downloaded package
    for i in $DOWNLOAD_DIR/$FILE_2CHECK; do
        if [ -f "$i" ]; then 
            DOWNLOADED_FILE=$i ;
            echo >&2 "File downloaded: $DOWNLOADED_FILE"; 
        fi
        break
    done

    # check if downloaded DOWNLOADED_FILE not found
    if [ ! -e "$DOWNLOADED_FILE" ]; then
        echo  >&2 'File was downloaded but not found'
        exit -1
    fi

    echo $DOWNLOADED_FILE
}
