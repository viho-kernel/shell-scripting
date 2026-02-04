#!/bin/bash

DIR=$(pwd)

while IFS= read -r line;do 
   echo "$line"
done <<< $DIR