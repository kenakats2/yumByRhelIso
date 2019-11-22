#!/bin/bash

. yumByRhelIso.conf 

if [ -e $isoFilePath ];then
  echo $isoFilePath
else
  echo "There is no file named "${isoFilePath} 
  exit 1
fi

# Create repo file for iso file
sudo tee /etc/yum.repos.d/dvd.repo << EOF
[dvd]
name=dvd
baseurl=file:///media/dvd/BaseOS
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release
EOF

# Update fstab
echo "${isoFilePath} /media/dvd   iso9660   loop,ro,auto,nofail 0 0" >> /etc/fstab

sudo mount -a
