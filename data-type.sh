#!/bin/bash

NUM1=30
NUM2=45

SUM=$((NUM1+NUM2))

echo "Total sum of numbers is $SUM"

ANIMALS=("Lion" "Cheetah" "TIGER")

echo "Animals in Zoo are: ${ANIMALS[$@]}"