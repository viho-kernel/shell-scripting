USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
echo "Run the script as Root User"
exit 1

fi

VALIDATE() {
    if [ $1 -ne 0 ]; then
       echo "$2... Failure"
    exit 1
    else
       echo "$2 ... Success"
    fi

}

dnf install nginx -y
VALIDATE $? "Installing NGINX"

dnf install mysql -y
VALIDATE $? "Installing mysql"

dnf install httpd -y
VALIDATE $? "Installing http"