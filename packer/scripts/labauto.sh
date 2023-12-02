#!/bin/bash

curl -s "https://raw.githubusercontent.com/mrjithendar/scripts/master/common-functions.sh" >/tmp/common-functions.sh
#source /root/scripts/common-functions.sh
source /tmp/common-functions.sh
## Checking Root User or not.
#CheckRoot

## Checking SELINUX Enabled or not.
#CheckSELinux

## Checking Firewall on the Server.
#CheckFirewall &>/dev/null

## Supported OS's
# CentOS 7
if [ ! -f /etc/centos-release ]; then
        error "Currently this setup works only for CentOS Operating System"
        exit 1
fi

EL=$(rpm -q basesystem | sed -e 's/\./ /g' |xargs -n1 | grep el)
if [ "$EL" != "el7" ]; then
        error "Currently this setup works only for CentOS-7 OS"
        exit 1
fi

if [ "$1" == "clean" ]; then
  cd /tmp
  rm -rf tools
  echo -e "\e[1;35m Cleanup Succeeded\e[0m"
  exit 0
else
  if [ -d /tmp/tools ]; then
    cd /tmp/tools
    git pull &>/dev/null
    if [ $? -ne 0 ]; then
      rm -rf /tmp/lab*
      git clone https://github.com/mrjithendar/tools.git /tmp/tools &>/dev/null
    fi
  else
    git clone https://github.com/mrjithendar/tools.git /tmp/tools &>/dev/null
  fi
fi

if [ ! -f /tmp/tools/setup.sh ]; then
  echo -e "\e[1;33m💡💡 Hint! Try Using \e[0m\e[1m'sudo labauto clean'\e[0m"
fi

sh /tmp/tools/setup.sh $*