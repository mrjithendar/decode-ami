#!/bin/bash

echo ${COMPONENT}

echo 'DevOps321' | sudo passwd --stdin root
chmod 700 /root/.ssh
chmod 600 /root/.ssh/authorized_keys
sudo service sshd restart