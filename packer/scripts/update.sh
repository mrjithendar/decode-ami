#!/bin/bash

####################################################################################################
sudo cat /etc/ssh/sshd_config | grep "PasswordAuthentication no"
sudo sed -i 's\PasswordAuthentication no\PasswordAuthentication yes\g' /etc/ssh/sshd_config
echo "enabled PasswordAuthentication"
sudo cat /etc/ssh/sshd_config | grep "PasswordAuthentication yes"

sudo cat /etc/ssh/sshd_config | grep "#PermitRootLogin yes"
sudo sed -i 's\#PermitRootLogin yes\PermitRootLogin yes\g' /etc/ssh/sshd_config
echo "enabled PermitRootLogin"
sudo cat /etc/ssh/sshd_config | grep "PermitRootLogin yes"

sudo cat /etc/cloud/cloud.cfg | grep "ssh_pwauth:   0"
sudo sed -i 's\ssh_pwauth:   0\ssh_pwauth:   1\g' /etc/cloud/cloud.cfg
echo "enabled sshPasswordAuth"
sudo cat /etc/cloud/cloud.cfg | grep "ssh_pwauth:"

sudo cat /etc/cloud/cloud.cfg | grep "disable_root: 1"
sudo sed -i 's\disable_root: 1\disable_root: 0\g' /etc/cloud/cloud.cfg
echo "enabled rootLogin"
sudo cat /etc/cloud/cloud.cfg | grep "disable_root: 0"

echo "Jithendar" | sudo passwd --stdin root
sudo systemctl restart sshd
echo "enabled root login with password::: Jithendar"

sudo yum update -y
sudo yum upgrade -y

echo "installing DevTools"
sudo yum install -y openssl-devel bzip2-devel libffi-devel
sudo yum -y groupinstall "Development Tools"
sudo wget https://www.python.org/ftp/python/3.11.0/Python-3.11.0a4.tgz
sudo tar -xzf Python-3.11.0a4.tgz
cd Python-3.11.0a4
sudo sh ./configure --enable-optimizations
sudo make altinstall