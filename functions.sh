USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
   echo "You are not a Root user"
   exit 1
else
   echo "You are a ROOT USER"

fi

VALIDATE() {
    if [ $1 -ne 0 ]; then
       echo "$2.... Failed :("
       exit 1
    else
       echo "$2.... Success :) "
    fi

}

dnf install nginx -y

VALIDATE $? "Installing Nginx"

dnf install mysql -y

VALIDATE $? "Installing mysql"

dnf install httpd -y

VALIDATE $? "Installing httpd"