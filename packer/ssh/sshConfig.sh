#!/bin/bash

sudo sed -i -e '/#PasswordAuthentication/d' /etc/ssh/sshd_config
sudo sed -i -e 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
echo "PasswordAuthentication is set to yes"

echo "updating login screen and config files"
sudo mv -fv /tmp/motd /etc/motd
sudo mv -fv /tmp/config /root/.ssh/config
sed -i -e 's/ssh_pwauth:   false/ssh_pwauth:   true/g' /etc/cloud/cloud.cfg

echo "updated root and centos user password to::: DevOps321"
sudo echo 'DevOps321' | sudo passwd --stdin root
sudo echo 'DevOps321' | sudo passwd --stdin centos

echo "updating /root/.ssh/config permissions"
sudo chown root /root/.ssh/config
sudo chmod 600 /root/.ssh/config

echo "restarting SSHD service"
sudo sudo service sshd restart