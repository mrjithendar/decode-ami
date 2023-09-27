#!/bin/bash

sudo yum update -y

echo "enabling root login with password::: Jithendar"
sudo sed -i 's\PasswordAuthentication no\PasswordAuthentication yes\g' /etc/ssh/sshd_config
sudo cat /etc/ssh/sshd_config | grep "PasswordAuthentication"
sudo sed -i 's\#PermitRootLogin prohibit-password\PermitRootLogin yes\g' /etc/ssh/sshd_config
sudo cat /etc/ssh/sshd_config | grep "PermitRootLogin"

sudo sed -i 's\disable_root: true\disable_root: false\g' /etc/cloud/cloud.cfg
sudo cat /etc/cloud/cloud.cfg | grep disable_root

sudo sed -i 's\ssh_pwauth:   false\ssh_pwauth:   true\g' /etc/cloud/cloud.cfg
sudo cat /etc/cloud/cloud.cfg | grep ssh_pwauth

echo "setting root password"
echo "Jithendar" | sudo passwd --stdin root

sudo systemctl restart sshd
echo "sshd restarted, root user can login with password"

echo "installing DevTools"
sudo yum -y install git vim zip jq wget cmake bzip2-devel libffi-devel zlib-devel openssl-devel
sudo yum -y groupinstall "Development Tools"

echo "installing Python and pip3"
sudo yum install python3.11 python3-pip
# curl -O https://bootstrap.pypa.io/get-pip.py
# python3 get-pip.py --user

sudo yum update -y
sudo yum upgrade -y

echo "Installing Roboshop required tools"
sudo yum install epel-release -y
sudo yum install -y make gcc gcc-c++ python3-devel

sudo yum update -y
sudo yum upgrade -y

