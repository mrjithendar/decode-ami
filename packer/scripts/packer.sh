#!/bin/bash 
echo "installing packer"
# sudo yum install -y yum-utils
# sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
# sudo yum -y install packer
cd /usr/local/bin/
wget https://releases.hashicorp.com/packer/1.9.4/packer_1.9.4_linux_amd64.zip
unzip packer_1.2.5_linux_amd64.zip
rm -f packer_1.2.5_linux_amd64.zip
cd
packer --version
echo "packer successfully Installed"