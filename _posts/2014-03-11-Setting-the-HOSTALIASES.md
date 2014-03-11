---
layout: post
title: "Setting the HOSTALIASES"
date: 2014-03-11
comments: true
categories:
- linux
description:
tags:
excerpt:
keywords:
- linux

---

### Setting the HOSTALIASES

{% codeblock %}

$ echo "g google.com" > /etc/host.aliases

$ echo "export HOSTALIASES=/etc/host.aliases" >> /etc/profile

$ source /etc/profile

$ ping g

{% endcodeblock %}
