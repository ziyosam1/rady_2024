#!/bin/bash
 
# AWS region
AWS_REGION="us-east-1"
 
# S3 bucket name
BUCKET_NAME="your-bucket-name"
 
# File to upload
FILE_TO_UPLOAD="path/to/local/file.txt"
 
# New file name in the bucket
NEW_FILE_NAME="new-file.txt"
 
# Create S3 bucket
aws s3 mb s3://$BUCKET_NAME --region $AWS_REGION
 
# Upload file to the bucket
aws s3 cp $FILE_TO_UPLOAD s3://$BUCKET_NAME/
 
# Rename file in the bucket
aws s3 mv s3://$BUCKET_NAME/$(basename $FILE_TO_UPLOAD) s3://$BUCKET_NAME/$NEW_FILE_NAME
 
# Delete the bucket and its contents
aws s3 rb s3://$BUCKET_NAME --force
