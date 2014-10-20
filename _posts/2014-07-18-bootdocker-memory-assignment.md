---
layout: post
title: boot2docker memory assignment
date: 2014-07-18
comments: true
categories:
- Docker 
description:
tags:
excerpt:
keywords:
- Docker

---

### boot2docker memory assignment

{% codeblock %}
$ boot2docker info | jq .
{
  "SerialFile": "/Users/seiji/.boot2docker/boot2docker-vm.sock",
  "SSHPort": 2022,
  "DockerPort": 2375,
  "BootOrder": null,
  "Flag": 0,
  "OSType": "",
  "Name": "boot2docker-vm",
  "UUID": "12755ff4-b054-4a87-81cc-f4ce041f8fd8",
  "State": "running",
  "CPUs": 4,
  "Memory": 2048,
  "VRAM": 8,
  "CfgFile": "/Users/seiji/VirtualBox VMs/boot2docker-vm/boot2docker-vm.vbox",
  "BaseFolder": "/Users/seiji/VirtualBox VMs/boot2docker-vm"
}

$ boot2docker destroy
$ boot2docker init -m 4096
$ boot2docker info | jq .
{
  "SerialFile": "/Users/seiji/.boot2docker/boot2docker-vm.sock",
  "SSHPort": 2022,
  "DockerPort": 2375,
  "BootOrder": null,
  "Flag": 0,
  "OSType": "",
  "Name": "boot2docker-vm",
  "UUID": "56ff7f05-746b-46b5-8e1c-f9c1f61e5b1b",
  "State": "poweroff",
  "CPUs": 4,
  "Memory": 4096,
  "VRAM": 8,
  "CfgFile": "/Users/seiji/VirtualBox VMs/boot2docker-vm/boot2docker-vm.vbox",
  "BaseFolder": "/Users/seiji/VirtualBox VMs/boot2docker-vm"
}
{% endcodeblock %}
