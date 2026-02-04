#!/bin/bash

LOG_FOLDER=/root/app-logs/
LOG_FILE="$LOG_FOLDER/$0.log"


#check if directory present or not

if [ -d $LOG_FOLDER ];then
   echo -e "$LOG_FOLDER does exist"
else 
   echo -e "$LOG_FOLDER does not exist"
   exit 1
fi

FILES_TO_DELETE=$(find $LOG_FOLDER -name "*.log" -mtime +14)
echo "Files to delete is: ${FILES_TO_DELETE}"
cd $LOG_FOLDER
rm ${FILES_TO_DELETE}
echo "Deleted ${FILES_TO_DELETE} file : \n)"