#!/bin/bash
#######################################
# Author: Vihari
# Date: 03-02-2026
#
# Version: v1
# This script will report the AWS resource usage.
########################################

# AWS S3
#AWS EC2
#AWS LAMBDA

#TO list s3 buckets.
aws s3 ls

#list ec2 instances
aws ec2 describe-instances 

#List aws lambda function
aws lambda list-functions

#List IAM Users
aws iam list-users