#!/bin/bash

############### enabling root login with password::: Jithendar ##########################
sudo sed -i 's\PasswordAuthentication no\PasswordAuthentication yes\g' /etc/ssh/sshd_config
sudo sed -i 's\#PermitRootLogin yes\PermitRootLogin yes\g' /etc/ssh/sshd_config
sudo sed -i 's\ssh_pwauth:   0\ssh_pwauth:   0\g' /etc/cloud/cloud.cfg
sudo sed -i 's\disable_root: 1\disable_root: 0\g' /etc/cloud/cloud.cfg
echo "Jithendar" | sudo passwd --stdin root

sudo systemctl restart sshd

sudo cat /etc/ssh/sshd_config | grep "PasswordAuthentication no"
sudo cat /etc/ssh/sshd_config | grep "PermitRootLogin yes"
sudo cat /etc/cloud/cloud.cfg | grep "ssh_pwauth:   0"
sudo cat /etc/cloud/cloud.cfg | grep "disable_root: 0"
echo "enabled root login with password::: Jithendar"
############### enabling root login with password::: Jithendar ##########################

sudo yum update -y

echo "installing DevTools"
sudo yum -y install git vim zip jq wget cmake bzip2-devel libffi-devel zlib-devel openssl-devel
sudo yum -y groupinstall "Development Tools"

echo "installing Python and pip3"
sudo yum install python3.11 python3-pip

sudo yum update -y
sudo yum upgrade -y

echo "Installing Roboshop required tools"
sudo yum install epel-release -y
sudo yum install -y make gcc gcc-c++ python3-devel
sudo yum install net-tools

sudo yum update -y
sudo yum upgrade -y

