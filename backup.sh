#!/bin/bash



USER_ID=$(id -u)
LOG_FOLDER="/root/shell-scripting/"
LOG_FILE="/var/log/shell-sctipt-logs/$0.log"

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
if [ $# lt 2 ];then
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