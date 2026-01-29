#!/bin/bash
Shebhang will be the first line of a .sh file which acts as a interpreter which tell machine to take bash as a scripting.

Assigning variables. While assigning there shld be no space between value and variable.
Person1=Suresh
Person2=Ramesh

how to call declared variables?
You can call variables using $Person1 and $(Person1)
Whenever linux see $ symbol it consider the word as variable.

Parameters and arguments $1 and $2 are special arguments which take the command line arguments in linnnux.

#!/bin/bash
Person1=$1

Person2=$2

# sh parameters.sh vihari dharani

Read function
Read function takes the input from user and store it, later you can resuse that.
echo "Please Enter your username::"
read USER_NAME

for password also same here but in order to hide it from displaying use -s 

How to execute commands in Linux keep them in $() and print them.
TIMESTAMP=$(date)
we keep command there and take output in variable.

sleep 10 == now process will sleep for 10 seconds

to get time in seconds exactly date +%s this will give date exactly in seconds
# date
Wed Jan 28 13:32:25 UTC 2026
# date +%s
1769607148

whenever we are doign mathematics in linux we do it in (()) double braces

one () is for mathematics and one for () taking command into variables.
$(($ENDTIME-$STARTTIME))

=========================================
Special Variables in Linux
=========================================
These are inbuilt variables inside created by shell.
***All special variables must be psssed inside "" "


all variable passed to script $@
no. of variables passed to script $#
Script name: $0
Present whih directory you are in: $PWD
who is running the script: $USER
Home directory of the user: $Home
PID Of the script: $$
to run a process in backgroup sleep 100 &
PID of recently executed background process id: $!

$@ vs $*
$@ treats args seperately
$* treats it as single args


===========================================
Data Types
============================================

Variables are used for holding data.
But data types define the kind of data we are holding.
number -> 
names -> string
yes or no -> boolean
skills -> list of skills, list of string
[lion cheetha tiger elephant]
array -> Map of skills
   {
   car: skoda
   hour: ten
   bat: big
   cat: white
   }
Adding Integers
NUM1=30
NUM2=45
SUM=$((NUM1+NUM2))
# sh data-type.sh
Total sum of numbers is 75
Declaring Array/List 
Collection of items
ANIMALS=("Lion" "Cheetah" "TIGER" "ELEPHANT")
