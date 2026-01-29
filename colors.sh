#!/bin/bash



USER_ID=$(id -u)
LOG_FOLDER="/var/log/shell-sctipt-logs"
LOG_FILE="/var/log/shell-sctipt-logs/$0.log"

R="\e[31m"
G="\e[32m"
B="\e[33m"
Y="\e[34m"
N="\e[0m"

mkdir -p $LOG_FOLDER

if [ $USER_ID -ne 0 ]; then
   echo "$R You are not a Root user $N" | tee -a $LOG_FILE
   exit 1
else
   echo "$g You are a ROOT USER $N"

fi

VALIDATE() {
    if [ $1 -ne 0 ]; then
       echo "$2.... is $R Failed     :( $N" | tee -a $LOG_FILE
       exit 1
    else
       echo "$2.... is $G Successful :) $N" | tee -a $LOG_FILE
    fi

}

for PACKAGE in $@
do 
   dnf list installed $PACKAGE &>>$LOG_FILE
   if [ $? -ne 0 ]; then
       echo "$Y $PACKAGE not installed $N, $G installing now"
   dnf install $PACKAGE -y &>> $LOG_FILE
   VALIDATE $? "Installing $PACKAGE"

   else 
       echo -e " $Y $PACKAGE installed already, $Y skipping $N" | tee -a $LOG_FILE

    fi
done