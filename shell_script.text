#!/bin/bash
echo ${date}

###################
for i in {1..10}
do
echo ${date}
sleep 1
done

#####################################
#awk command & cut delimiters
for i in {1..10}
do
echo $(date) | awk -F " " '{print $1}
sleep 1
done

#############################
for in in {1..10}; do echo $(date) | awk -F " " '{print $1,$2,$3}'; sleep1; done

#Variable declaration

SG='devops'
echo $SG

####################################
#double quotes
x=9
sg='sai-ops-$x'
echo $sg

############################
#aws cli install, after create IAM role-->>s3, in ec2-instance sceurity modify IAM role attach
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
##############################

aws s3 ls

aws s3 ls | cut -d " " -f 1
#for large environments to copy the logs this is best to use command
aws s3 ls | cut -d " " -f 2 > text.logs

cat text.logs


aws s3 ls | cut -d " " -f 1,2,3
aws s3 ls | cut -d " " -f 2,3

#awk command to use when i need require 3 , 2, 1 field
aws s3 ls | awk -F " " '{print $1}'

aws s3 ls | awk -F " " '{print $1,$2}'

aws s3 ls | awk -F " " '{print $3,$2,$1}'

#in logs want only specific word so use(GREP)
#The -i option tells grep to perform a case-insensitive search. This means that it will match patterns regardless of whether the letters are in uppercase or lowercase
aws s3 ls | cut -d ' ' -f 3 | grep -i www.

#(E GREP)  avoid the . , + -
#The -E option enables extended regular expressions (ERE) in grep. This allows you to use more advanced pattern matching features that aren't available with basic regular expressions (BRE). In other words, it expands the set of features available in regular expressions, such as supporting more complex syntax like +, ?, {}, and | for alternation.

aws s3 ls | cut -d ' ' -f 3 | grep -E www[-]


aws s3 ls | cut -d ' ' -f 3 | grep -E www[.]
echo 'welcome the world'
#########################
aws ec2 describe-vpcs --region us-east-1 | jq

aws ec2 describe-vpcs --region us-east-1 | jq ".Vpcs[]"

aws ec2 describe-vpcs --region us-east-1 | jq ".Vpcs[].VpcId"

#remove double quotes
aws ec2 describe-vpcs --region us-east-1 | jq ".Vpcs[].VpcId" -r

aws ec2 describe-vpcs --region us-east-1 | jq ".Vpcs[].VpcId" | tr -d '"'

aws ec2 describe-vpcs --region us-east-1 | jq ".Vpcs[].VpcId" | tr -d '"' | tr '[:lower:]' '[:upper:]'

#Passing Parameters
REGION='us-east-1'
aws ec2 describe-vpcs --region ${REGION} | jq ".Vpcs[].VpcId" -r

#########################
#!/bin/bash
REGION=$1
aws ec2 describe-vpcs --region ${REGION} | jq ".Vpcs[].VpcId" -r


###############################
# Understanding of $#?
aws --version
if [ $? -eq 0 ]; then
    REGION=$1
    aws ec2 describe-vpcs --region ${REGION} | jq ".Vpcs[].VpcId" -r
else
    echo "incorrect command"
fi

####################################
# Understanding of $@
#!/bin/bash
aws --version
if [ $? -eq 0 ]; then
    REGION=$@
    for REGION in ${REGION}; do
    aws ec2 describe-vpcs --region ${REGION} | jq ".Vpcs[].VpcId" -r
    done
else
    echo "incorrect command"
fi
####################################
#Using “$*” Enclosing the variable $* with double quotes means all arguments will be treated as a single string
#Using “$@” The variable $@ treats each command-line argument as a separate element in an array
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
####################################
