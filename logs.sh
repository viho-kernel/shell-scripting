#!/bin/bash

USER_ID=$(id -u)
LOG_FOLDER="/var/log/shell-sctipt-logs"
LOG_FILE="/var/log/shell-sctipt-logs/$0.log"

mkdir -p $LOG_FOLDER

if [ $USER_ID -ne 0 ]; then
   echo "You are not a Root user" | tee -a $LOG_FILE
   exit 1
else
   echo "You are a ROOT USER"

fi

VALIDATE() {
    if [ $1 -ne 0 ]; then
       echo "$2.... is Failed     :(" | tee -a $LOG_FILE
       exit 1
    else
       echo "$2.... is Successful :) " | tee -a $LOG_FILE
    fi

}

for PACKAGE in $@
do 
   dnf list installed $PACKAGE &>>$LOG_FILE
   if [ $? -ne 0 ]; then
       echo "$PACKAGE not installed, installing now"
   dnf install $PACKAGE -y &>> $LOG_FILE
   VALIDATE $? "Installing $PACKAGE"

   else 
       echo " $PACKAGE installed already, \e[34mskipping" | tee -a $LOG_FILE

    fi
done