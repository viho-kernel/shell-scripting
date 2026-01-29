USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
   echo "USER is not a ROOT"
   exit 1
else
   echo "User is a ROOT Guy :) Proceed further"
   exit 0

fi

VALIDATE() {
    if [ $1 -ne 0 ]; then
      echo "$2.... Failed :("
      exit 1
    else
      echo "$2.... Success :)"
      exit 0
    fi 
}

dnf install nginx -y
VALIDATE $? "Insalling Nginx"
