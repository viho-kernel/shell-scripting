id -u == to get the current running User-ID
id ==0 Root user
id == 1 non root user
$? == exit code of previous command

When a code is repeating for itself we keep it in functions.
Functions are intended to complete specific task, it takes in put and does the job again n again.

Function VALIDATE() {
calling arguments inside a function
if [ $1 -ne 0 ]; then
echo "$2 Failure"
exit 1
else
echo "$2 is succsss"
}
echo "installing nginx"
dnf install nginx -y
VALIDATE $? "nginx installation"

==============================================
Output Redirection
=============================================

TO SAVE An output while redirection

ls -l > error.txt

ls -l 1 > output.txt ==> if command is success then redirection happen
ls -l 2> output.txt ==> if command is failure then save here.

When we are not sure about command output then give &

ls -l &> output.txt -> the data will be overriden for single >

ls -l &>>output.txt -> the data will not be overriden for double >>

While creating anything if it's already present and if you want to ingore it -p

mkdir -p /var/log/binbash -> if binbash is there then -p will ingore it will not throw any error

$0 -> to get the present file name.

=======================
Tee Command
=======================
Tee command will append the standard input and save it in somewhere you desire.

to save the output both on screen and inside file you use tee command

tee -a $LOG_FILE
'-a' equlas to append

============================
Loops
===========================
