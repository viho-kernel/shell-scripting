#!/bin/bash

LOG_FOLDER="/var/log/shell-sctipt-logs"
LOG_FILE="/var/log/shell-sctipt-logs/$0.log"
Bl="\e[30m" 
R="\e[31m" 
G="\e[32m" 
Y="\e[33m" 
B="\e[34m" 
W="\e[37m"
N="\e[0m"

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
   echo -e " $R You are not running the script as Root User. $N"
   exit 1
else
   echo "$G You are already a Root USER :) $N"
fi

mkdir -p $LOG_FOLDER

VALIDATE() {
if [ $1 -ne 0 ]; then
    echo -e "$R $2... Failed $N" | tee -a $LOG_FILE 
    EXIT 1
else
    echo -e "$G $2... Successful $N" | tee -a $LOG_FILE 
fi

}

for PACKAGE in $@
do
   dnf list installed $PACKAGE | tee -a $LOG_FILE 
if [ $? -ne 0 ]; then
   dnf install $PACKAGE -y | tee -a $LOG_FILE 
      
   echo "$PACKAGE not installed succesfully. Hence, installing" | tee -a $LOG_FILE
else
   echo "$PACKAGE already installed. So skipping dude." | tee -a $LOG_FILE

done

fi

VALIDATE $? "$PACKAGE installation"
