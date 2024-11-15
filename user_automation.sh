#!/bin/bash
if [ $# -gt 0 ]; then 
   USER=$1
   echo $USER
   EXISTING_USER=$(cat /etc/passwd | grep -i -w $USER | cut -d ":" -f1)
   if [ "${USER}" = "${EXISTING_USER}" ]; then   
       echo "The $USER you have enterred is present"
   else
       echo "lETS CREATE A NEW $USER"
       sudo useradd -m $USER --shell /bin/bash
   fi
else   
   echo "Please Enter the valid parameter"
fi
