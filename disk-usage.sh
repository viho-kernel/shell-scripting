#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"
MESSAGE=""
Instance_ID=$(curl http://169.254.169.254/latest/meta-data/instance-id)
SUBJECT="High Disk Utilization Alert 🚨 on ${Instance_ID}"
IP_ADDRESS=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
log(){
    echo -e "$(date "+%Y-%m-%d %H:%M:%S") | $1" | tee -a $LOG_FILE
}

DISK_USAGE=$(df -hT | grep -v Filesystem)
USAGE_THRESHOLD=10

while IFS= read -r line
do
   USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
   PARTITION=$(echo $line | awk '{print $7}')

   if [ "$USAGE" -ge "$USAGE_THRESHOLD" ]; then
        MESSAGE+="High Disk Usage on $PARTITION: $USAGE%\n"

   fi


done <<< $DISK_USAGE

#echo -e "$MESSAGE"

sh mail.sh "vihari.reddy1802@gmail.com" "${SUBJECT}" "${MESSAGE}" "DISK_UTILIZATION" "${IP_ADDRESS}" "DevOps Team" "${Instance_ID}"