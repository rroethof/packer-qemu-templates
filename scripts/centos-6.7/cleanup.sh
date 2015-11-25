#!/bin/bash

set -e
set -x

if rpm -q --whatprovides kernel | grep -Fqv $(uname -r); then
  rpm -q --whatprovides kernel | grep -Fv $(uname -r) | xargs sudo yum -y remove
fi

echo "Clean yum cache"
yum --enablerepo=epel clean all
yum history new

echo "Remove DHCP leases"
rm /var/lib/dhclient/*

echo "Clean udev rules"
rm /etc/udev/rules.d/70-persistent-net.rules
sed -i '/HWADDR/d' /etc/sysconfig/network-scripts/ifcfg-eth0

echo "Remove SSH host keys"
rm -f /etc/ssh/ssh_host*key*

echo "Remove history"
history -c
unset HISTFILE
