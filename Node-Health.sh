#!/bin/bash

################################################
#Author: Vihari
#DATE: 03-02-2026
#
# This script outputs the node health
# Version: v1
################################################

set -x #debug mode

echo "Print the Disk Space"
df -h

echo "Print the memory"
free -g

echo "Print the CPU"
dfproc