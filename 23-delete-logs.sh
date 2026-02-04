#!/bin/bash

LOG_FOLDER=/root/app-logs/


#check if directory present or not

if [ -d $LOG_FOLDER ];then
   echo -e "$LOG_FOLDER does exist"
else 
   echo -e "$LOG_FOLDER does not exist"
   exit 1
fi

FILES_TO_DELETE=$(find $LOG_FOLDER -name "*.txt"  -mtime +14)

while IFS= read -r line; do 
  echo "Files to delete is: $line "
  cd $LOG_FOLDER
  rm $line
echo "Deleted $line file :)"

done <<< $FILES_TO_DELETE