#!/bin/bash

login() {
echo "Please Enter your username::"
read USER_NAME
echo "Your Username is $USER_NAME"

echo "Enter the password::"
read -s PASSWORD
echo "Login successful :)"

}
echo "Press 1 to Login 2 to exit"
read OPTION
if [ $OPTION -eq 1 ]; then
   login();
elif [ $OPTION -eq 2 ]; then
   exit 1;

fi

