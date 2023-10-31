#!/bin/bash

echo ${COMPONENT}

sudo rm -rf /etc/ssh/sshd_config
sudo mv -f /tmp/sshd_config /etc/ssh/sshd_config

echo 'DevOps321' | sudo passwd --stdin root
sudo service sshd restart

sudo yum install -y python3.11 wget vim unzip python3-pip