#!/bin/bash

############### enabling root login with password::: Jithendar ##########################
sudo cat /etc/ssh/sshd_config | grep "PasswordAuthentication no"
sudo sed -i 's\PasswordAuthentication no\PasswordAuthentication yes\g' /etc/ssh/sshd_config
sudo cat /etc/ssh/sshd_config | grep "PasswordAuthentication yes"

sudo cat /etc/ssh/sshd_config | grep "#PermitRootLogin yes"
sudo sed -i 's\#PermitRootLogin yes\PermitRootLogin yes\g' /etc/ssh/sshd_config
sudo cat /etc/ssh/sshd_config | grep "PermitRootLogin yes"

sudo cat /etc/cloud/cloud.cfg | grep "ssh_pwauth:"
sudo sed -i 's\ssh_pwauth:   1\ssh_pwauth:   0\g' /etc/cloud/cloud.cfg
sudo cat /etc/cloud/cloud.cfg | grep "ssh_pwauth:"

sudo cat /etc/cloud/cloud.cfg | grep "disable_root:"
sudo sed -i 's\disable_root: 0\disable_root: 1\g' /etc/cloud/cloud.cfg
sudo cat /etc/cloud/cloud.cfg | grep "disable_root:"

echo "Jithendar" | sudo passwd --stdin root
sudo systemctl restart sshd
echo "enabled root login with password::: Jithendar"
############### enabling root login with password::: Jithendar ##########################