#!/bin/bash

echo ${COMPONENT}

sudo rm -rf /etc/ssh/sshd_config
sudo mv -vf /tmp/sshd_config /etc/ssh/sshd_config

echo 'DevOps321' | sudo passwd --stdin root
chmod 700 /root/.ssh
chmod 600 /root/.ssh/authorized_keys
sudo service sshd restart

sudo yum install -y python3.11 wget vim unzip python3-pip