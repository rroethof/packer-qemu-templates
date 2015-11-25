install
url --url http://mirror.nl.leaseweb.net/centos/7/os/x86_64/ 
repo --name updates --baseurl=http://mirror.nl.leaseweb.net/centos/7/updates/x86_64/

text
skipx
bootloader

firewall --disabled
selinux --disabled
firstboot --disabled

lang en_US.UTF-8
keyboard us 
timezone --utc Etc/UTC

zerombr
clearpart --all --initlabel
part /boot --size=500
part swap --hibernation
part / --size=3000 --grow 

rootpw --plaintext TempInstallPW
authconfig --enableshadow --passalgo=sha512

reboot

%packages --nobase
@core
-*firmware
-b43-openfwwf
-efibootmgr
-audit*
-libX*
-fontconfig
-freetype
sudo
openssh-clients
openssh-server
gcc
make
perl
kernel-firmware
kernel-devel
%end

%post
sed -i 's/^.*requiretty/#Defaults requiretty/' /etc/sudoers
sed -i 's/rhgb //' /boot/grub/grub.conf
%end
