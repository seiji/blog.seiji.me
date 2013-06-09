---
layout: post
title: "issue commands using parallel distributed shell (pdsh)"
date: 2012-08-01 15:33
comments: true
categories: 
- Linux
description: 
keywords:
- pdsh
---

{% codeblock %}
// Install
$ brew install pdsh
// Setting
$ mkdir -p ~/.dsh/group
$ cat ~/.dsh/group/vps
linode
linode2
// Issue command
$ pdsh -g vps df -h | dshbak -c
----------------
linode
----------------
Filesystem            Size  Used Avail Use% Mounted on
/dev/xvda              20G  9.8G  9.6G  51% /
tmpfs                 243M  124K  243M   1% /dev/shm
----------------
linode2
----------------
Filesystem            Size  Used Avail Use% Mounted on
/dev/xvda              20G  5.1G   15G  27% /
tmpfs                 243M  124K  243M   1% /dev/shm

{% endcodeblock %}

