#!/bin/bash

url="https://ec2-13-58-113-233.us-east-2.compute.amazonaws.com"
response="$(curl -ik "$url" | grep HTTP/1.1 | tail -1 | awk {'print $2'})"

if [ $response -eq 200 ]
then
	echo “Hello, You accessed me Sucessfully!!”
else
	echo “Hello, You cant access me now. Somthing seems to be wrong!!!!!”
fi