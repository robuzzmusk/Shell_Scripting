#!/bin/bash
REGION='us-east-1'
aws ec2 describe-vpcs --region ${REGION} | jq ".Vpcs[].VpcId" -r

#!/bin/bash
REGION=$1
aws ec2 describe-vpcs --region ${REGION} | jq ".Vpcs[].VpcId" -r

#$?
if [ $# -gt 0 ]; then
    aws --version
    if [ $? -eq 0 ]; then
        REGIONS=$@
        for REGION in ${REGIONS}; do
            aws ec2 describe-vpcs --region ${REGION} | jq ".Vpcs[].VpcId" -r
            echo "__________________________________________________________________________"
        done
    else
        "Incorrect Command"
    fi
else
    echo "Please the correct arguments"
fi
