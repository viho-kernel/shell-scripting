#!/bin/bash
#######################################
# Author: Vihari
# Date: 03-02-2026
#
# Version: v1
# This script will report the AWS resource usage.
########################################

set -e


# AWS S3
#AWS EC2
#AWS LAMBDA

#TO list s3 buckets.

echo "==============================="
echo "S3 Buckets"
aws s3 ls
#list ec2 instances
echo "==============================="
echo "ec2 instance"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

#List aws lambda function
echo "==============================="
echo "Lambda functions"
aws lambda list-functions

#List IAM Users
echo "==============================="
echo "IAM users"
aws iam list-users | jq 'Users[].UserName.UserID'