#!/bin/bash

#This script is to find all the details related to aws task
 
echo "EC2 instances created and running from  15 days"
echo "==========================================="
aws ec2 describe-instances --query 'Reservations[*].Instances[*][].{id: InstanceId, type: InstanceType, launched: LaunchTime}' | grep `date --date="-15 days" +%Y-%m-%d`
echo "==========================================="
echo -e "\n"
 
echo "EC2 instances created and running from  30 days"
echo "==========================================="
aws ec2 describe-instances --query 'Reservations[*].Instances[*][].{id: InstanceId, type: InstanceType, launched: LaunchTime}' | grep `date --date="-30 days" +%Y-%m-%d`
echo "==========================================="
echo -e "\n"

echo "EC2 instances created and running from  7 days"
echo "==========================================="
aws ec2 describe-instances --query 'Reservations[*].Instances[*][].{id: InstanceId, type: InstanceType, launched: LaunchTime}' | grep `date --date="-7 days" +%Y-%m-%d`
echo "==========================================="
echo -e "\n"

echo "###################################################################################################################"
echo "Snapshots older than 30 Days"
echo "==========================================="
aws ec2 describe-snapshots --region ap-south-1 --output table | grep `date --date="-30 days" +%Y-%m-%d`
echo "==========================================="
echo -e "\n"

echo "Snapshots older than 15 Days"
echo "==========================================="
aws ec2 describe-snapshots --region ap-south-1 --output table | grep `date --date="-15 days" +%Y-%m-%d`
echo "==========================================="
echo -e "\n"

echo "Snapshots older than 7 Days"
echo "==========================================="
aws ec2 describe-snapshots --region ap-south-1 --output table | grep `date --date="-7 days" +%Y-%m-%d`
echo "==========================================="
echo -e "\n"

echo "###################################################################################################################"
echo "AMI's older than 180 days"
echo "==========================================="
aws  ec2 describe-images --owners amazon --region ap-south-1 --query 'Images[*].{ID:ImageId,Name:Name,CreationDate:CreationDate}' | grep `date --date="-180 days" +%Y-%m-%d`
echo "==========================================="
echo -e "\n"

echo "AMI's older than 90 days"
echo "==========================================="
aws  ec2 describe-images --owners amazon --region ap-south-1 --query 'Images[*].{ID:ImageId,Name:Name,CreationDate:CreationDate}' | grep `date --date="-90 days" +%Y-%m-%d`
echo "==========================================="
echo -e "\n"

echo "AMI's older than 30 days"
echo "==========================================="
aws  ec2 describe-images --owners amazon --region ap-south-1 --query 'Images[*].{ID:ImageId,Name:Name,CreationDate:CreationDate}' | grep `date --date="-30 days" +%Y-%m-%d`
echo "==========================================="
echo -e "\n"

echo "AMI's older than 15 days"
echo "==========================================="
aws  ec2 describe-images --owners amazon --region ap-south-1 --query 'Images[*].{ID:ImageId,Name:Name,CreationDate:CreationDate}' | grep `date --date="-15 days" +%Y-%m-%d`
echo "==========================================="
echo -e "\n"
echo "###################################################################################################################"
echo "Unused volumes created 15 days ago"
echo "==========================================="
aws ec2 describe-volumes --output text --filters Name=status,Values=available | grep `date --date="-15 days" +%Y-%m-%d`
echo "==========================================="
echo -e "\n"

echo "Unused volumes created 30 days ago"
echo "==========================================="
aws ec2 describe-volumes --output text --filters Name=status,Values=available | grep `date --date="-30 days" +%Y-%m-%d`
echo "==========================================="
echo -e "\n"

echo "Unused volumes created 60 days ago"
echo "==========================================="
aws ec2 describe-volumes --output text --filters Name=status,Values=available | grep `date --date="-60 days" +%Y-%m-%d`
echo "==========================================="
echo -e "\n"

echo "##################################################################################################################"
echo "List of all unattached elastic ip addresses"
echo "==========================================="
aws ec2 describe-addresses --output table
echo "==========================================="
echo -e "\n"
echo "##################################################################################################################"
echo "List the bucket details in S3"
echo "==========================================="
aws s3 ls s3://sumit.kmr371 --recursive --human-readable --summarize
echo "==========================================="

