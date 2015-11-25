#!/bin/bash

set -e
set -x

sudo yum -y install http://mirror.i3d.net/pub/fedora-epel//7/x86_64/e/epel-release-7-5.noarch.rpm
sudo sed -i -e 's/^enabled=1/enabled=0/' /etc/yum.repos.d/epel.repo
