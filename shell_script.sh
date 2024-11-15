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
