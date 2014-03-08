---
layout: post
title: "Pidora on Raspberry Pi"
date: 2014-03-08
comments: true
categories: 
- Raspberry Pi
description: 
keywords: 
- Raspberry Pi
tags:
excerpt: 
---

### Download

{% codeblock %}

$ curl -L -o pidora.zip http://downloads.raspberrypi.org/pidora_latest

$ unzip pidora.zip

$ openssl md5 pidora-18-r2c.img
MD5(pidora-18-r2c.img)= 9e2d83c0f1572d65b60554227583b35c

$ cat pidora-18-r2c.img.md5sum 
9e2d83c0f1572d65b60554227583b35c  pidora-18-r2c.img

{% endcodeblock %}

### Copy image to SDCard

{% codeblock %}

$ df -h
Filesystem      Size   Used  Avail Capacity  iused   ifree %iused  Mounted on
/dev/disk1s1    29Gi  2.3Mi   29Gi     1%        0       0  100%   /Volumes/UNTITLED

$ diskutil unmount /dev/disk1s1

$ sudo dd bs=1m if=pidora-18-r2c.img of=/dev/rdisk1
1709+1 records in
1709+1 records out
1792275456 bytes transferred in 106.479653 secs (16832093 bytes/sec)

{% endcodeblock %}

### Enabling headless mode 

{% codeblock %}

$ df -h
Filesystem      Size   Used  Avail Capacity  iused   ifree %iused  Mounted on
/dev/disk1s1    50Mi   17Mi   33Mi    35%      512       0  100%   /Volumes/boot

$ cat << EOF > /Volumes/boot/headless
IPADDR=192.168.1.105
NETMASK=255.255.255.0
GATEWAY=192.168.1.1
RESIZE
SWAP=512
EOF

$ diskutil unmount /dev/disk1s1

{% endcodeblock %}

### Create swap file

{% codeblock %}

$ ssh root@192.168.1.105

[root@raspi ~]# dd if=/dev/zero of=/swapfile bs=1024 count=65536

[root@raspi ~]# mkswap /swapfile

[root@raspi ~]# swapon /swapfile

[root@raspi ~]# echo '/swapfile swap swap defaults 0 0' >>/etc/fstab

{% endcodeblock %}


