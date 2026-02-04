#!/bin/bash

FOLDER=/root/app-log

if [ -d $FOLDER ]; then
   echo "Folder ${FOLDER} does exist"
else
   echo "Folder ${FOLDER} doesn't exist"
   exit 1
fi


FILES_TO_DELETE=$( find $FOLDER -name "*.log" -mtime +14 )

while IFS= read -r line;
do
   echo "Moving to the Directory"
   cd $FOLDER
   echo " The files which has to be deleted $line "
   echo " =================Deleting the Files==============="
   rm $line
   echo " =================Deleted the Files================"
done <<< $line