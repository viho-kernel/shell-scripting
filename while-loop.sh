#!/bin/bash

COUNT=1

while [ $COUNT -le 3 ];
do
   echo "Showing all the files in directory"
   ls -la
   sleep 5
   ((COUNT++))

done