#!/bin/bash

# From bug in this URL
# https://askubuntu.com/questions/63594/mount-encrypted-volumes-from-command-line
# My answer is below.

# My encrypted HD usually has sda3

# Alternative way to unlock the HD
# cryptsetup luksOpen /dev/sda3 my_encrypted_volume

udisksctl unlock -b /dev/sda3
udisksctl mount -b /dev/mapper/ubuntu--vg-root

mkdir /media/my_hd

# usually the path /dev/dm-1 is shown as the output from the mount previous command 
mount /dev/dm-1 /media/my_hd/


