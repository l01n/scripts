#!/bin/bash
# author: loin

# TODO, clean this script up more to where it's not just a chain of commands.

# update this version with the latest on the 'vmware-host-modules' github
# could find a way to pull the version and not have to fat-finger it.
VMWARE_VERSION=workstation-17.5.1
TMP_FOLDER=/tmp/patch-vmware
rm -fdr $TMP_FOLDER
mkdir -p $TMP_FOLDER
cd $TMP_FOLDER
git clone https://github.com/mkubecek/vmware-host-modules.git
cd $TMP_FOLDER/vmware-host-modules
git checkout $VMWARE_VERSION
git fetch
make
sudo make install
sudo rm /usr/lib/vmware/lib/libz.so.1/libz.so.1
sudo ln -s /lib/x86_64-linux-gnu/libz.so.1 /usr/lib/vmware/lib/libz.so.1/libz.so.1
sudo /etc/init.d/vmware restart
