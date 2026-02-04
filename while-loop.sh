#!/bin/bash

DIR=$(pwd)

cd ${DIR}

COUNT=1

while [ $COUNT -lt 3 ];
do
   echo "Showing all the files in directory"
   ls -la
   ((count++))

done