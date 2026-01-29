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
       echo "$2.... Failed :(" | tee -a $LOG_FILE
       exit 1
    else
       echo "$2.... Success :) " | tee -a $LOG_FILE
    fi

}

dnf install nginx -y &>> $LOG_FILE

VALIDATE $? "Installing Nginx"

dnf install mysql -y &>> $LOG_FILE

VALIDATE $? "Installing mysql"

dnf install httpds -y &>> $LOG_FILE

VALIDATE $? "Installing httpd"