#!/bin/bash

set -e
set -x

sudo sed -i -e 's,^ACTIVE_CONSOLES=.*$,ACTIVE_CONSOLES=/dev/tty1,' /etc/sysconfig/init

echo "Mount partitions with noatime attribute"
sed -i '0,/defaults/{s/defaults/defaults,noatime/g}' /etc/fstab

echo "Install packages"
yum -y groupinstall base
yum -y install acpid ntp
chkconfig rdisc on
