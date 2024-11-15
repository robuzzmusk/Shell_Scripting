#!/bin/bash
REGION='us-east-1'
aws ec2 describe-vpcs --region ${REGION} | jq ".Vpcs[].VpcId" -r

#!/bin/bash
REGION=$1
aws ec2 describe-vpcs --region ${REGION} | jq ".Vpcs[].VpcId" -r

#$?
awd --version
if [$? -eq 0]; then
    REGION=$1
    aws ec2 describe-vpcs --region ${REGION} | jq ".Vpcs[].VpcId" -r
else
    echo "incorrect command"
fi
