#!/bin/bash

if ! [ $(id -u) = 0 ]; then
   echo "This script must be run as root" 
   exit 1
fi

apt-get install davfs2 -y
mkdir -p /mount/cloud
usermod -a -G davfs2 root
chmod u+s /usr/sbin/mount.davfs

echo "Enter webdav url:"
read cloud_url

echo "Enter username:"
read cloud_user

echo "Enter password:"
read -s cloud_pass

cloud_fstab="\"$cloud_url\"	/media/cloud	davfs	defaults,uid=pi,gid=pi,_netdev,auto	0	0"
echo $cloud_fstab >> /etc/fstab

touch /etc/davfs2/secrets
chmod 0600 /etc/davfs2/secrets
cloud_secret="\"$cloud_url\"    \"$cloud_user\" \"$cloud_pass\""
echo $cloud_secret >> /etc/davfs2/secrets

mount -a
