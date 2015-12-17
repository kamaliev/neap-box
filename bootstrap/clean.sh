#!/bin/sh

# Removing leftover leases and persistent rules
echo "Cleaning up dhcp leases"
rm /var/lib/dhcp/*

# Make sure Udev doesn't block our network
echo "Cleaning up udev rules"
rm /etc/udev/rules.d/70-persistent-net.rules
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/
rm /lib/udev/rules.d/75-persistent-net-generator.rules

echo "Adding a 2 sec delay to the interface up, to make the dhclient happy"
echo "pre-up sleep 2" >> /etc/network/interfaces

echo "Purge old kernels"
apt-get -y -q remove $(dpkg -l|egrep '^ii  linux-(im|he)'|awk '{print $2}'|grep -v `uname -r`)
update-grub

echo "Clean Aptitude"
apt-get -y -q autoremove
apt-get -y -q clean

echo "Remove all temporary files"
rm -rf /tmp/*
rm -rf /usr/src/*
rm -rf /var/tmp/*
rm -rf /var/log/*.log
rm -rf /var/log/**/*.log

echo "Nullify free space"
dd if=/dev/zero of=/EMPTY bs=4096k
rm -rf /EMPTY
# Sync to ensure that the delete completes before this moves on.
sync
sync
sync

# To remove history, execute the following logged in through SSH:
# cat /dev/null > ~/.bash_history && history -c && exit

exit 0
