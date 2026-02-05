#!/bin/bash



USER_ID=$(id -u)
LOG_FOLDER="/root/shell-scripting-logs/"
LOG_FILE="$LOG_FOLDER/$0.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #defaukt is no.of days 14 is default


if [ $USER_ID -ne 0 ]; then
   echo -e "$R You are not a Root user $N" | tee -a $LOG_FILE
   exit 1
else
   echo -e "$G You are a ROOT USER $N"

fi

mkdir -p $LOG_FOLDER

USAGE(){
    #this function telling user what are the minimum requirements
    echo -e "sudo backup <SOURCE_DIR> <DEST_DIR> <DAYS>[default 14 days] $N"
}

log () {
    echo -e "$(date "+%Y-%m-%d %H:%M:%S") | $1" | tee -a $LOG_FILE
}

if [ $# -lt 2 ];then
   USAGE
fi

if [ ! -d $SOURCE_DIR ]; then
     echo " $R #SOURCE_DIR Does not exist"
     exit 1

fi

if [ ! -d $DEST_DIR ]; then
     echo " $R #DEST_DIR Does not exist"
     exit 1

fi

#finding files

FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

log "Backup Started"
log "Source Directory: $SOURCE_DIR"
log "Destination Directory: $DEST_DIR"
log "Days: $DAYS"

if [ -z "${FILES}" ]; then
    log "No Files to archieve... $Y Skipping $N"
else
    #app-logs-$timestamp.zip
    log "Files found to archieve: $FILES"
    TIMESTAMP=$(date +%F-%H-%M-%S)
    ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.tar.gz"
    echo "Archieve Name: $ZIP_FILE_NAME"
    tar -zcvf "$ZIP_FILE_NAME" $(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

    if [ -f $ZIP_FILE_NAME ]; then
        log "Archieval is ... $G success $N"

        while IFS= read -r filepath; 
        do
          echo "Deleting files: $filepath"
          rm -f $filepath
          echo "Deleted file: $filepath"
        done <<< $FILES
    else
        log "Archieval is ... $G Failure $N"
        exit 1
    fi

fi