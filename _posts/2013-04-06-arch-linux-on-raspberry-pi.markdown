---
layout: post
title: "Arch Linux on Raspberry Pi"
date: 2013-04-06 11:53
comments: true
categories: 
- Raspberry Pi
description: 
keywords: 
- Raspberry Pi
---

### Create SDCard

{% codeblock %}

$ wget http://downloads.raspberrypi.org/images/archlinuxarm/archlinux-hf-2013-02-11/archlinux-hf-2013-02-11.zip

$ shasum archlinux-hf-2013-02-11.zip

$ unzip archlinux-hf-2013-02-11.zip

$ df -h
Filesystem      Size   Used  Avail Capacity  iused    ifree %iused  Mounted on
/dev/disk5s1    29Gi  2.1Mi   29Gi     1%        0        0  100%   /Volumes/NO NAME

$ diskutil unmount /dev/disk5s1

$ sudo dd bs=1m if=archlinux-hf-2013-02-11.img of=/dev/rdisk5
1850+0 records in
1850+0 records out
1939865600 bytes transferred in 117.117264 secs (16563447 bytes/sec)

{% endcodeblock %}

Reference
[Raspberry Pi | Arch Linux ARM](http://archlinuxarm.org/platforms/armv6/raspberry-pi)

### Update packages

{% codeblock %}

[root@alarmpi ~]# pacman -Syu

[root@alarmpi ~]# reboot

{% endcodeblock %}

### Resize the partition to match the SD card 

{% codeblock %}

[root@alarmpi ~]# fdisk /dev/mmcblk0
Welcome to fdisk (util-linux 2.22.2).

Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help): p

Disk /dev/mmcblk0: 31.7 GB, 31674335232 bytes, 61863936 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x0004f23a

        Device Boot      Start         End      Blocks   Id  System
/dev/mmcblk0p1   *        2048      186367       92160    c  W95 FAT32 (LBA)
/dev/mmcblk0p2          186368     3667967     1740800   83  Linux

Command (m for help): d
Partition number (1-4): 2
Partition 2 is deleted

Command (m for help): n
Partition type:
   p   primary (1 primary, 0 extended, 3 free)
   e   extended
Select (default p): p
Partition number (1-4, default 2): 2
First sector (186368-61863935, default 186368):
Using default value 186368
Last sector, +sectors or +size{K,M,G} (186368-61863935, default 61863935):
Using default value 61863935
Partition 2 of type Linux and of size 29.4 GiB is set

Command (m for help): w
The partition table has been altered!

Calling ioctl() to re-read partition table.

WARNING: Re-reading the partition table failed with error 16: Device or resource busy.
The kernel still uses the old table. The new table will be used at
the next reboot or after you run partprobe(8) or kpartx(8)
Syncing disks.

[root@alarmpi ~]# reboot

[root@alarmpi ~]# resize2fs /dev/mmcblk0p2

{% endcodeblock %}

