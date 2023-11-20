#!/bin/bash

sudo rm -rvf /etc/ssh/sshd_config
echo "Removed sshd_config file, and files from ssh folder to /tmp"
sudo mv -fv /tmp/_ssh.conf /etc/ssh/sshd_config

echo "updating login screen and config files"
sudo mv -fv /tmp/_motd /etc/motd
sudo mv -fv /tmp/_config /root/.ssh/config
sed -i -e 's/ssh_pwauth:   false/ssh_pwauth:   true/g' /etc/cloud/cloud.cfg

echo "updated root password::: DevOps321"
sudo echo 'DevOps321' | sudo passwd --stdin root

echo "updating /root/.ssh/config permissions"
sudo chown root /root/.ssh/config
sudo chmod 600 /root/.ssh/config

echo "restarting SSHD service"
sudo sudo service sshd restart