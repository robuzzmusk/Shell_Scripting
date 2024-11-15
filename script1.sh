#!/bin/bash

# Check if any arguments are passed
if [ $# -gt 0 ]; then
    # Check if AWS CLI is installed and working
    aws --version
    if [ $? -eq 0 ]; then
        # Loop through each region passed as argument
        for REGION in "$@"; do
            echo "Describing VPCs in region: $REGION"
            aws ec2 describe-vpcs --region ${REGION} | jq ".Vpcs[].VpcId" -r
            echo "____________________________________________________________________________________________"
        done
    else
        echo "AWS CLI is not installed or not working."
    fi
else
    echo "No regions provided. Please provide one or more AWS regions."
fi

# Print number of arguments passed
echo "Number of arguments: $#"
