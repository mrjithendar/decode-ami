#!/bin/bash

sudo yum update -y

echo "installing DevTools"
sudo yum -y install git vim zip jq wget cmake bzip2-devel libffi-devel zlib-devel openssl-devel
sudo yum -y groupinstall "Development Tools"

echo "installing Python and pip3"
sudo yum install -y python3.11 python3-pip

sudo yum update -y
sudo yum upgrade -y

echo "Installing Roboshop required tools"
sudo yum install epel-release -y
sudo yum install -y make gcc gcc-c++ python3-devel
sudo yum install net-tools -y

sudo yum update -y
sudo yum upgrade -y

