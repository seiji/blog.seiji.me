---
layout: post
title: "rubymotion can't open simulator in tmux."
date: 2012-10-18 22:53
comments: true
categories: 
- RubyMotion
description: 
keywords: 
- RubyMotion
---

### Solution

{% codeblock %}
$ brew install reattach-to-user-namespace 
$ echo 'set-option -g default-command "reattach-to-user-namespace -l $SHELL"' >> ~/.tmux.conf"
{% endcodeblock %}

#### in case that warning: unsupported new OS, trying as if it were 10.6-10.7

{% codeblock %}
$ brew update
$ brew upgrade reattach-to-user-namespace 
{% endcodeblock %}

or

{% codeblock %}
$ brew edit reattach-to-user-namespace
# dadea0aa48259c704d0b412b9588de2f5623e323 (on line 6) to ece1935953593d05e98d8c3ee8f956b2429d633f
# dadea0 (on line 7) to ece193

$ brew upgrade reattach-to-user-namespace 
{% endcodeblock %}
