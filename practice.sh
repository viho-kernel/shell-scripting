#!/bin/bash

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
   EXIT 1
else
   echo "$Y Run as Root User :) $N"
fi

VALIDATE() {
if [ $1 -ne 0 ]; then
    echo -e "$R $2... Failed $N"
    EXIT 1
else
    echo -e "$G $2... Successful $N"
fi

}

for PACKAGE in $@
do
   dnf install $PACKAGE -y
done

VALIDATE $? "$PACKAGE installation"