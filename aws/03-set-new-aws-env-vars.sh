#!/bin/bash

# Change AWS env vars to the newly dynamic generated ones:
read -s -p "AWS Access Key ID: " aws_key
echo
read -s -p "AWS Secret Access Key: " aws_secret
echo

# These settings are for the AWS CLI to be able to show that you can list the instances.

export AWS_ACCESS_KEY_ID="$aws_key"
export AWS_SECRET_ACCESS_KEY="$aws_secret"

